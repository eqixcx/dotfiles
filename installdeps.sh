## install script for dotfiles on arch linux
## created by cooper@eqix.tech on the 26/11/2021

# update pacman
clear
echo Updating pacman repositories
echo ----------------------------
sudo pacman -Syy

# begin with installing base i3
clear 
echo Installing base xorg and i3-gaps
echo --------------------------------
sudo pacman -S xorg-server xorg-apps xorg-xinit i3-gaps i3status i3lock network-manager-applet --noconfirm

# install pulseaudio and other utilities
clear
echo Installing Pulseaudio and other utilities
echo -----------------------------------------
sudo pacman -S pulseaudio pulseaudio-alsa pulseaudio-bluetooth pasystray --noconfirm

# install rofi for app menu
clear
echo Installing Rofi
echo ---------------
mkdir /tmp/rofisetup
cd /tmp/rofisetup
sudo pacman -S rofi --noconfirm
git clone --depth=1 https://github.com/adi1090x/rofi.git
cd rofi
chmod +x setup.sh
clear
echo Running Rofi Theme Installer from adi1090x@github
./setup.sh
rm -rf /tmp/rofisetup


# install bluetooth drivers and frontend
clear
echo Installing Bluetooth and frontend
echo ---------------------------------
sudo pacman -S bluez bluez-utils blueberry --noconfirm
sudo systemctl enable bluetooth.service

# install other utilities that i like to use on arch
clear
echo Installing extra utilities I like to use on arch
echo ------------------------------------------------
sudo pacman -S neofetch htop git base-devel --noconfirm

# install desktop manager (login screen, etc)
clear
echo Installing LightDM Display Manager
echo ----------------------------------
sudo pacman -S lightdm lightdm-gtk-greeter --noconfirm

# install neat fonts and stuff
clear
echo Installing extra fonts
echo ----------------------
sudo pacman -S noto-fonts ttf-ubuntu-font-family ttf-dejavu ttf-freefont ttf-liberation ttf-droid ttf-inconsolata ttf-roboto terminus-font ttf-font-awesome --noconfirm

# enable lightdm as display manager
clear
echo Enabling LightDM as display manager
echo -----------------------------------
sudo systemctl enable lightdm

# switch to using zsh as default shell
clear
echo Installing and making Zsh default shell
echo ---------------------------------------
sudo pacman -S zsh --noconfirm
# TODO: ADD ZSH SWAP

# install lxappearance and some icon and gtk themes 
clear
echo Installing lxappearance to change themes
echo ----------------------------------------
sudo pacman -S lxappearance-gtk3 --noconfirm

## experimental
# install yay (idk if this will work - appears to be working)
clear
echo Installing yay package manager
echo ------------------------------
mkdir /tmp/yayinstall
cd /tmp/yayinstall
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
echo -------------------------------
echo Clearing temp yay install files
rm -rf /tmp/yayinstall

# setup wallpapers
clear
echo Installing feh to manage the wallpaper
echo --------------------------------------
sudo pacman -S feh

chmod +x ./copytoconfig.sh
./copytoconfig.sh