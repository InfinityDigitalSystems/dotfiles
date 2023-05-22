#!/bin/sh
autorandr --change
light -S 100 &
feh --randomize --bg-fill ~/.config/desktopwallpapers/ &
