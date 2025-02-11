#!/bin/zsh
sudo apt install gnome-tweaks
sudo apt install gnome-shell-extensions
sudo apt install gnome-shell-extension-manager
local_icon_dir="$HOME/.local/share/icons"

# Customized dock: Go to gnome website install extension: dash-to-dock
# sudo apt install dconf-editor

# Install hydra-paper
flatpak install flathub org.gabmus.hydrapaper

# Touchpad
sudo add-apt-repository ppa:touchegg/stable
sudo apt install touchegg
printf "===================================================\n"
printf "Start up extension manager to install X11 Gestures.\n"
printf "===================================================\n"

# Bibata cursor
Bibata_type="Bibata-Modern-Ice"
wget https://github.com/ful1e5/Bibata_Cursor/releases/download/v2.0.7/${Bibata_type}.tar.xz -P "$local_icon_dir"
tar -xvf "$local_icon_dir/${Bibata_type}.tar.xz" -C "$local_icon_dir"
sudo tar -xvf "$local_icon_dir/${Bibata_type}.tar.xz" -C "/usr/share/icons/"
rm ${local_icon_dir}/*.tar.xz

# Orchis-theme
git clone https://github.com/vinceliuice/Orchis-theme.git "$local_icon_dir/Orchis-theme"
cd $local_icon_dir/Orchis-theme
./install.sh -t red --tweaks compact macos

# icon
sudo add-apt-repository ppa:papirus/papirus
sudo apt-get update
sudo apt-get install papirus-icon-theme -y
