#!/bin/bash

# List of packages from the official repositories
official_packages=(
  file-roller
tree
chromium
alacritty 
arandr 
autorandr
base-devel 
bat 
bitwarden 
bitwarden-cli 
bluez
bluez-utils
brightnessctl
catdoc 
chafa 
clipmenu 
composer 
dbus 
python-dbus-next
docx2txt 
dunst 
fd 
feh 
ffmpegthumbnailer
findutils
firefox 
flameshot 
fuse3 
fzf
git 
glib2
glow
gnome-keyring 
polkit-gnome
gnumeric 
gvfs
gvfs-smb
htop 
imagemagick
kitty 
lazygit 
lf 
light-locker
lightdm
lightdm-gtk-greeter 
lxappearance 
lxrandr 
mandoc
nano 
neofetch 
neovim 
network-manager-applet
noto-fonts 
noto-fonts-cjk 
noto-fonts-emoji 
noto-fonts-extra 
npm 
odt2txt 
p7zip
pasystray
perl-image-exiftool 
picom 
pulseaudio-bluetooth
pulsemixer 
pyright 
python-adblock 
poppler
python-pip 
python-psutil 
python-pyperclip 
python-tldextract 
qalculate-gtk 
qt5ct 
qtile 
qutebrowser 
reflector
ripgrep 
rofi 
rofi-emoji 
rust 
sshfs
strace
thunar
thunderbird
trash-cli
ttf-dejavu 
ttf-jetbrains-mono-nerd 
ttf-ubuntu-font-family 
udiskie 
unrar 
unzip 
vim 
xdg-utils 
xdotool
xorg-server 
xorg-xinit 
xsel 
yt-dlp 
zip 
)

# List of AUR packages
aur_packages=(
mcomix 
xapp-epub-thumbnailer
wkhtmltopdf-static
bibata-cursor-theme 
onlyoffice-bin 
papirus-linux-universe 
mpris2controller-git 
unclutter-xfixes-git 
ueberzugpp
chromium-widevine 
brave-bin 
spotify
cp-p-git
)

# Install packages from the official repositories
sudo pacman -Syu --noconfirm --needed "${official_packages[@]}"

# Check if yay is installed, install if necessary
if ! command -v yay &> /dev/null; then
  echo "Installing yay..."
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si --noconfirm
  cd ..
  rm -rf yay
fi

# Install AUR packages using yay
yay -S --noconfirm --needed "${aur_packages[@]}"
