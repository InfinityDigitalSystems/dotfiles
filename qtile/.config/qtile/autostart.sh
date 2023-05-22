#!/bin/sh
picom &
light -S 100 &
clipmenud &
feh --randomize --bg-fill ~/.config/desktopwallpapers/ &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
# gnome-keyring-daemon --start --components=secrets &
nextcloud &
dunst &
