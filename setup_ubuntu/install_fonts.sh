#!/bin/bash

prompt_user() {
    local prompt_message="$1"
    printf "\n $prompt_message (y/n): " 
    read -r  response
    if [[ "$response" =~ ^[Yy]$ ]]; then
        return 0
    else
        return 1
    fi
}

sudo apt install -y unzip wget
if prompt_user "Install MesloLGS NF"; then
	CUSTOM_FONT_DIR="$HOME/Documents/fonts"
	SYSTEM_FONT_DIR="/usr/share/fonts/truetype/custom"
	mkdir -p "$CUSTOM_FONT_DIR"
	sudo mkdir -p $SYSTEM_FONT_DIR
	wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Meslo.zip -P "$CUSTOM_FONT_DIR/"
	unzip "$CUSTOM_FONT_DIR/*.zip" -d "$CUSTOM_FONT_DIR/"
	sudo rm -f "$CUSTOM_FONT_DIR"/*.zip  "$CUSTOM_FONT_DIR"/*.txt "$CUSTOM_FONT_DIR"/*.md
	sudo cp -r "$CUSTOM_FONT_DIR"/*.ttf "$SYSTEM_FONT_DIR"
	sudo fc-cache -fv
	printf "Finished! Please log out the system and log in again. Set the font you prefered."
fi 
