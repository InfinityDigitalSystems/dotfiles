autorandr --change
xrdb ~/.Xresources
export EDITOR=nvim
export DEVICE_TYPE=PC
export BACKLIGHT=amdgpu_bl0
export QT_QPA_PLATFORMTHEME=qt5ct
export SCREENS=2
xmodmap ~/.Xmodmap
exec qtile start
