# Hobanialauncher

[![GitHub release)](https://img.shields.io/github/v/release/hobania/hobanialauncher?include_prereleases)](https://github.com/hobania/Hobanialauncher/releases) [![License](https://img.shields.io/github/license/hobania/hobanialauncher?color=blue)](https://github.com/hobania/Hobanialauncher/blob/master/LICENSE) [![Discord](https://img.shields.io/discord/449602562165833758?label=discord)](https://discord.gg/rvbW3Z4) [![AUR version](https://img.shields.io/aur/version/hobanialauncher?label=AUR)](https://aur.archlinux.org/packages/hobanialauncher/)

A cross-platform Hobania launcher.

![Hobanialauncher](https://i.imgur.com/1VkndRZ.gif)

## Features

- [x] Update/Download and start nightly.
- [x] Fancy UI with batteries included.
- [x] Updates itself on windows.

## Download

**NOTE:** Hobanialauncher cannot be considered stable yet.

#### Compile from source

```bash
git clone https://gitlab.com/hobania/hobanialauncher.git
cd hobanialauncher
cargo run --release
```

Make sure to have [rustup](https://rustup.rs/) installed to compile rust code and [git lfs](https://book.hobania.net/contributors/development-tools.html#git-lfs) for assets.

### Hobanialauncher-Server

**NOTE:** Hobanialauncher-Server is not required by end-users.

#### Compile from source

```bash
git clone https://gitlab.com/hobania/hobanialauncher.git
cd hobanialauncher
cargo run --release --bin hobanialauncher-server
```

On first execution, a template configuration file will be created at `config/config.template.ron` and the server will exit.

Rename this to `config.ron` and edit as appropriate before running again.

```bash
cargo run --release --bin hobanialauncher-server
```

#### For NixOS users

You can install Hobanialauncher with:
- Flakes enabled Nix: `nix profile install github:hobania/Hobanialauncher`
- Flakes disabled Nix: `nix-env -i -f "https://github.com/hobania/Hobanialauncher/tarball/master"`
