{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flakeCompat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
    nci = {
      url = "github:yusdacra/nix-cargo-integration";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs: let
    lib = inputs.nixpkgs.lib;
    ncl = inputs.nci.lib.nci-lib;

    cleanedSrc = builtins.path {
      name = "airshipper-source";
      path = toString ./.;
      filter = path: type:
        lib.all
        (n: builtins.baseNameOf path != n)
        [
          "rust-toolchain"
          "rustfmt.toml"
          "shell.nix"
          "default.nix"
          "flake.nix"
          "flake.lock"
          "TROUBLESHOOTING.md"
          "CONTRIBUTING.md"
          "CHANGELOG.md"
          "CODE_OF_CONDUCT.md"
          "WORKFLOW.md"
          "PACKAGING.md"
        ];
    };

    makePatcher = pkgs: let
      runtimeLibs = with pkgs; (
        [libxkbcommon udev alsa-lib stdenv.cc.cc.lib libGL vulkan-loader]
        ++ (with xorg; [libxcb libX11 libXrandr libXi libXcursor])
      );
    in
      pkgs.writeShellScript "patch" ''
        echo "making binaries executable"
        chmod +x {veloren-voxygen,veloren-server-cli}
        echo "patching dynamic linkers"
        ${pkgs.patchelf}/bin/patchelf \
          --set-interpreter "${pkgs.stdenv.cc.bintools.dynamicLinker}" \
          veloren-server-cli
        ${pkgs.patchelf}/bin/patchelf \
          --set-interpreter "${pkgs.stdenv.cc.bintools.dynamicLinker}" \
          --set-rpath "${lib.makeLibraryPath runtimeLibs}" \
          veloren-voxygen
      '';
  in
    inputs.nci.lib.makeOutputs {
      root = ./.;
      config = common: {
        outputs.defaults = {
          app = "airshipper";
          package = "airshipper";
        };
        runtimeLibs = [
          "vulkan-loader"
          "wayland"
          "wayland-protocols"
          "libxkbcommon"
          "xorg.libX11"
          "xorg.libXrandr"
          "xorg.libXi"
          "xorg.libXcursor"
        ];
      };
      pkgConfig = common: let
        inherit (common) pkgs;
        addOpenssl = prev: {
          buildInputs = ncl.addBuildInputs prev [pkgs.openssl];
          nativeBuildInputs = ncl.addNativeBuildInputs prev [pkgs.pkg-config];
        };
      in {
        airshipper.overrides = {
          cleaned-src = {src = cleanedSrc;};
        };
        airshipper-server.depsOverrides = {
          add-openssl.overrideAttrs = addOpenssl;
        };
        airshipper-server.overrides = {
          add-openssl.overrideAttrs = addOpenssl;
          cleaned-src = {src = cleanedSrc;};
        };
        airshipper.wrapper = _: old: let
          patcher = makePatcher pkgs;
        in
          common.internal.pkgsSet.utils.wrapDerivation old
          {nativeBuildInputs = [pkgs.makeWrapper];}
          ''
            rm -rf $out/bin
            mkdir -p $out/bin
            ln -sf ${old}/bin/* $out/bin
            wrapProgram $out/bin/* --set VELOREN_PATCHER "${patcher}"
          '';
      };
    };
}
