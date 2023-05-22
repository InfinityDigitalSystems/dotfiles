# TODO
## Groups
### dynamic groups 
The ability to add / remove general groups dynamically would be great
#### Fix the group keybind script under keymaps.py

### Add new and better widgets
After looking at the default arco qtile config some of the general system widgets (particullary the network and bluetooth one) seem to intergrate much better then my current system

### make the scratch pad / app keybind genration cleaner
some ideas I have for this is to seperate the system and have the system auto generate system scratch pads (pavucontrol, blueberry, term etc) and then I can generate keymaps much the same but it will be for general keywords like `toggle volume control scratchpad`

### add a system calendar

### add notification logging and some better system for dealing with unread notificaitons

### Add keymaps for brightness control
### Add x86 system keymaps for launching things like email etc
### Add some sort of system tray (maybe using a scratchpad group?)

# IDS QTILE CONFIG

## Dependencies 

### Core
 - **mpris2controller** `yay -S mpris2controller-git`
 - **rofi** `sudo pacman -S rofi`
 - **rofi-emoji** `sudo pacman -S rofi-emoji`
 - **clipmenu** `sudo pacman -S clipmenu`
 - **feh** `sudo pacman -S feh`
 - **python-psutil** `sudo pacman -S python-psutil`
 - **picom** `sudo pacman -S picom`
 - **gnome-keyring** `sudo pacman -S gnome-keyring`
 - **gnome-session** `sudo pacman -S gnome-session`
 - **dunst** `sudo pacman -S dunst`
 - **udisks2** `sudo pacman -S udisks2`
#### Fonts
 - **notofonts** `sudo pacman -S noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra`
 - **JetBrainsMono Nerd Font** `sudo pacman -S ttf-jetbrains-mono-nerd`
 - **ttf-ubuntu-font-family** `sudo pacman -S ttf-ubuntu-font-family`
 - **ttf-dejavu** `sudo pacman -S ttf-dejavu`

### Default APPS
> These are the apps that are used by default
 - **qutebrowser** `sudo pacman -S qutebrowser`
 - **bitwarden** `sudo pacman -S bitwarden`
 - **lf** `sudo pacman -S lf`
 - **qalculate-gtk** `sudo pacman -S qalculate-gtk`
##### Terminals
> I use both Kitty and Alacritty I prefer kitty for file management with lf because of image previews, But prefer alacritty for most other uses.
> Easy to change terminal settings under config.py
 - **Alacritty** `sudo pacman -S alacritty`
 - **Kitty** `sudo pacman -S kitty`
