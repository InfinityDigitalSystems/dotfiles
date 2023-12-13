#!/bin/sh
autorandr --change
light -S 100 &
feh --randomize --bg-fill ~/desktopwallpapers &
qtile cmd-obj -o cmd -f reload_config
