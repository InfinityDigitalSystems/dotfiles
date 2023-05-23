![screenshot](https://i.imgur.com/CorPYfL.png) 
# Dependencies 

## Core
 - **mpris2controller** `yay -S mpris2controller-git`
 - **rofi** `sudo pacman -S rofi`
 - **rofi-emoji** `sudo pacman -S rofi-emoji`
 - **clipmenu** `sudo pacman -S clipmenu`
 - **feh** `sudo pacman -S feh`
 - **python-psutil** `sudo pacman -S python-psutil`
 - **picom** `sudo pacman -S picom`
 - **gnome-session** `sudo pacman -S gnome-session`
 - **brightness_ctl** `sudo pacman -S brightnessctl`
 - **dunst** `sudo pacman -S dunst`
 - **udiskie** `sudo pacman -S udiskie`
 - **unclutter-xfixes** `yay -S unclutter-xfixes-git`
 - **light-locker** `pacman -S light-locker`
### Fonts
 - **notofonts** `sudo pacman -S noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra`
 - **JetBrainsMono Nerd Font** `sudo pacman -S ttf-jetbrains-mono-nerd`
 - **ttf-ubuntu-font-family** `sudo pacman -S ttf-ubuntu-font-family`
 - **ttf-dejavu** `sudo pacman -S ttf-dejavu`

## Default APPS
> These are the apps that are used by default
 - **audio_control** `sudo pacman -S pulsemixer`
 - **music_player** `yay -S spotify`
 - **bluetooth_control** `yay -S bluetuith`
 - **web_browser** `sudo pacman -S qutebrowser`
 - **password_manager** `sudo pacman -S bitwarden`
 - **file_manager** `sudo pacman -S lf`
 - **calculator** `sudo pacman -S qalculator-gtk`
 - **screenshots** `sudo pacman -S flameshot`
### Terminals
> Easy to change terminal settings under config.py
 - **Alacritty** `sudo pacman -S alacritty`
 - **Kitty** `sudo pacman -S kitty`

# Setup & Installation
> The below instruction assume you are running xorg, arch and that `qtile` is already installed

## Scripts
make sure `./scripts/autostart`, `./scripts/refresh_system`, `./scripts/find_file` are executable.

## Enviroment Variables
This config uses enviroment variables for setting a few basic options.
### Screens
Please set the enviroment variable `SCREENS` to the number of screens you would like qtile to setup
> If there is no enviroment variable set for `SCREENS` it will default to 3
#### Screen Order
> These enviroment vairables will be used for switching between screens
> If no values default xrandr index order will be used
> You can see screen index by using `xrandr --listmonitors`
- SCREEN_1 - Set this to the xrandr screen index for this screen
- SCREEN_2 - Set this to the xrandr screen index for this screen
- SCREEN_3 - Set this to the xrandr screen index for this screen
### Device Type
Please set the enviroment variable `DEVICE_TYPE` to `LAPTOP` to enable laptop widgets like `battery`, `backlight`
> If you would like to use the backlight widget you will need to uncomment it under screens.py and set the BACKLIGHT enviroment variable to your backlight

# Keymappings
 - **<MOD, "c">** _Cylcle through window layouts_
 - **<MOD, "m">** _Toggle Max Layout_
 - **<MOD, "f">** _Toggle Floating Layout_
 - **<MOD, "t">** _Bring all floating windows to the top_
 - **<MOD, "mod1", "c">** _Close current window_
 - **<MOD, "mod1", "r">** _Refresh system **(Restart qtile, run refresh script)**_
 - **<MOD, "mod1", "q">** _Quit Qtile_
 - **<MOD, "n">** _Minimize current window_
 - **<MOD, "b">** _Launch prompt to add label to current group_
 - **<XF86AudioRaiseVolume">** _Increase Pulse Volume_
 - **<XF86AudioLowerVolume">** _Decrease Pulse Volume_
 - **<XF86AudioMute">** _Mute Pulse Volume_
 - **<XF86AudioPlay">** _Toggle Play/Pause using `mpris2controller`_
 - **<XF86AudioNext">** _Skip to next track using `mpris2controller`_
 - **<XF86AudioPrev">** _Skip to previous track using `mpris2controller`_
 - **<MOD, "k">** _Focus shift up_
 - **<MOD, "j">** _Focus shift down_
 - **<MOD, "h">** _Focus shift left_
 - **<MOD, "l">** _Focus shift right_
 - **<MOD, "shift","h">** _Shift Focus screen left_
 - **<MOD, "shift","l">** _Shift Focus screen right_
 - **<MOD, "space">** _Next window in current stack (Or left tab)_
 - **<MOD, "shift","space">** _Previous window in current stack (Or right tab)_
 - **<MOD, "o">** _Next window in current stack (Or left tab)_
 - **<MOD, "p">** _Previous window in current stack (Or right tab)_

## Group Keybinds
 - **<MOD, ",">** _Switch to group to left (skips empty groups)_
 - **<MOD, ".">** _Switch to group to right (skips empty groups)_
 - **<MOD, "1">** _Switch to group 1_
 - **<MOD, "2">** _Switch to group 2_
 - **<MOD, "3">** _Switch to group 3_
 - **<MOD, "4">** _Switch to group 4_
 - **<MOD, "5">** _Switch to group 5_
 - **<MOD, "6">** _Switch to group 6_
 - **<MOD, "7">** _Switch to group 7_
 - **<MOD, "8">** _Switch to group 8_
 - **<MOD, "9">** _Switch to group 9_
 - **<MOD, "0">** _Switch to group 0_
 - **<MOD, "q">** _Switch to group q_
 - **<MOD, "w">** _Switch to group w_
 - **<MOD, "e">** _Switch to group e_
 - **<MOD, "shift", "1">** _Move current window to group 1_
 - **<MOD, "shift", "2">** _Move current window to group 2_
 - **<MOD, "shift", "3">** _Move current window to group 3_
 - **<MOD, "shift", "4">** _Move current window to group 4_
 - **<MOD, "shift", "5">** _Move current window to group 5_
 - **<MOD, "shift", "6">** _Move current window to group 6_
 - **<MOD, "shift", "7">** _Move current window to group 7_
 - **<MOD, "shift", "8">** _Move current window to group 8_
 - **<MOD, "shift", "9">** _Move current window to group 9_
 - **<MOD, "shift", "0">** _Move current window to group 0_
 - **<MOD, "shift", "q">** _Move current window to group q_
 - **<MOD, "shift", "w">** _Move current window to group w_
 - **<MOD, "shift", "e">** _Move current window to group e_

## App Launch Keybinds
 - **<MOD, "x"> "f"** _Show `file_manager` dropdown **(defined in config.py)**_
 - **<MOD, "x"> "c"** _Show `calculator` dropdown **(defined in config.py)**_
 - **<MOD, "x"> "m"** _Show `music_player` dropdown **(defined in config.py)**_
 - **<MOD, "x"> "p"** _Show `password_manager` dropdown **(defined in config.py)**_
 - **<MOD, "x"> "w"** _Launch `web_browser` **(defined in config.py)**_
 - **<MOD, "x"> "Return"** _Launch `terminal` **(defined in config.py)**_
 - **<MOD, "x"> "e"** _Launch `email_client` **(defined in config.py)**_
 - **<MOD, "x"> "s"** _Launch `screenshot_software` **(defined in config.py)**_
 - **<MOD, "x"> "b"** _Show `bluetooth service` dropdown **(defaults to `blueberry`)**_
 - **<MOD, "x"> "t"** _Show `system calendar` dropdown **(defaults to `calcurse`)**_
 - **<MOD, "x"> "v"** _Show `volume control` dropdown **(defaults to `pavucontrol`)**_
 - **<MOD, "s">** _Launch `find_file` **(script under `./scripts/find_file`)**_
 - **<MOD, "v">** _Launch `clipboard` **(defined in config.py)**_
 - **<MOD, "Return">** _Show `terminal` dropdown **(defined in config.py)**_
 - **<MOD, "x"> <Shift, "e">** _Launch `emoji_keyboard` **(defined in config.py)**_
 - **<MOD, "d">** _Launch `app_launcher` **(defined in config.py)**_
 - **<MOD, "Tab">* _Launch `task_switcher` **(defined in config.py)**_*

## Window Control Mode 
 You can enter Window control mode with **<MOD, "r">**
 - **<MOD, "k">** _Focus shift up_
 - **<MOD, "j">** _Focus shift down_
 - **<MOD, "h">** _Focus shift left_
 - **<MOD, "l">** _Focus shift right_
 - **<"shift", "h">** _Grow current window to left, Shrink floating window horizontally__
 - **<"shift", "l">** _Grow current window to right, Grow floating window horizontally_
 - **<"shift", "j">** _Grow current window down, Grow floating window vertically_
 - **<"shift", "k">** _Grow current window up, Shrink floating window vertically_ 
 - **<"mod1", "h">** _Move current window to the left_
 - **<"mod1", "l">** _Move current window to the right_
 - **<"mod1", "j">** _Move current window down_
 - **<"mod1", "k">** _Move current window up_

# Custom behaivor / plugins
## Traversing
The `traverse.py` plugin is installed with only a single modificaiton made so that `traverse.py` will not focus hidden windows

## Floating window manipulation & BSP resize
Custom plugin `resize_move_floating_windows.py` is installed which when used will allow you to resize / move floating windows and changes the resize behaiver of the bsp layout to be more like columns.

The plugin will first check if the current window is floating then if the layout is bsp if neither of these are `True` it will revert to normal layout resize

# Configuration / Hacking
> config file tree
>```
>├── config.py
>├── [icons]
>├── keymaps.py
>├── layouts_and_groups.py
>├── plugins.py
>├── README.md
>├── screens.py
>└── scripts
>    ├── autostart
>    ├── find_file
>    └── refresh_system
>```
