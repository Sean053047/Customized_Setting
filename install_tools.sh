#!/bin/bash

prompt_user() {
    local prompt_message="$1"
    printf "\n$prompt_message (y/n): " 
    read -r  response
    if [[ "$response" =~ ^[Yy]$ ]]; then
        return 0
    else
        return 1
    fi
}
check_apt_package_installed() {
    PACKAGE=$1
    if dpkg-query -W -f='${Status}' "$PACKAGE" 2>/dev/null | grep -q "install ok installed"; then
        echo "$PACKAGE has been installed."
        return 0  # Package is installed
    else
        echo "$PACKAGE is not installed."
        return 1  # Package is not installed
    fi
}

check_dir_package_installed() {
    package_dir=$1
    if [ -d $package_dir ]; then 
    	echo "$package_dir has already been installed."
    	return 0 # Succeed 
    else
    	return 1
    fi
}
sudo apt install tmux vim wget git curl htop nvtop gpg -y
if prompt_user "Set git default user and email?";then 
	printf "\ngit default username: "
	read -p " " -e  response
	git config --global user.name "$response"
	printf "\ngit default user email: "
	read -p " " -e  response
	git config --global user.email "$response"
fi
if prompt_user "Set git default editor?";then
	printf "\ngit default editor: "
	read -p " " -e  response
	git config --global core.editor "$response"
	git config --global init.defaultBranch main
fi

# Install zsh and set it as default
if  ! check_apt_package_installed "zsh" && prompt_user "Install zsh?" ;then
	sudo apt install zsh -y
fi

if prompt_user "Change zsh as default?"; then
	chsh -s $(which zsh)
	printf "Succeed!\n"
fi

# Install oh-my-zsh
if ! check_dir_package_installed "$HOME/.oh-my-zsh" && prompt_user "Install oh-my-zsh"; then
  sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi 

# INSTALL powerlevel10k
plevel10k_dir="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
if ! check_dir_package_installed "$plevel10k_dir" && prompt_user "Install powerlevel10k?"; then
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$plevel10k_dir"
fi
if prompt_user "Set powerlevel10k as default theme of zsh?"; then
	replace_theme="powerlevel10k/powerlevel10k"
	sed -i "s|^ZSH_THEME=\".*\"|ZSH_THEME=\"$replace_theme\"|" "$HOME/.zshrc"	
fi

# Install zsh extensions
completions_dir="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-completions"
if ! check_dir_package_installed "$completions_dir" && prompt_user "Install zsh-completions?"; then
	git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
fi 

autosuggestions_dir="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
if ! check_dir_package_installed "$autosuggestions_dir" && prompt_user "Install zsh-autosuggestions?";then
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi 

highlighting_dir="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
if ! check_dir_package_installed "$highlighting_dir" && prompt_user "Install zsh-syntax-highlighting?";then 
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi 

sed -i "s|^plugins=.*|plugins=( git zsh-completions zsh-autosuggestions zsh-syntax-highlighting )|" "$HOME/.zshrc"	
echo "End of install zsh-related package. Please reopen the terminal."

