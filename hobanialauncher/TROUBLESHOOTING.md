# Troubleshooting

This page lists common issues and solutions which might work.

# Logs

You can aquire the logs by either running via the terminal (`hobanialauncher -h` to view logging options) or find `hobanialauncher.log` at: 
|   OS    |                    Path                    |
| :-----: | :----------------------------------------: |
| Windows |           `%appdata%/hobanialauncher`           |
|  Linux  |        `~/.local/share/hobanialauncher`         |
|  MacOS  | `~/Library/Application Support/hobanialauncher` |

## Graphical issues

**Note**: In General incase hobanialauncher does not open or display correct you can use the cli (or use compatibility desktop shortcut on windows) by
1. Opening a terminal
   > On Windows press `Windows key + R`. Then type `cmd` and hit `enter`. 
2. Type `hobanialauncher run` and hit enter
3. Enjoy the game.

#### Known graphical issues

- ##### `surface does not support the adapter's queue family: panicked at 'surface does not support the adapter's queue family'`
    on linux set `VK_ICD_FILENAMES=/etc/vulkan/icd.d/nvidia_icd.json`


- ##### `error marshalling arguments for create_prime_buffer: dup failed: Bad file descriptor`
    on wayland set `VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/radeon_icd.x86_64.json`
