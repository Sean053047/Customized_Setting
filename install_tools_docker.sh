#!/bin/bash

USER=""
EMAIL=""
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --git_user)
            USER="$2"
            shift 2
            ;;
        --git_email)
            EMAIL="$2"
            shift 2
            ;;
        *)
            echo "Unknown parameter passed: $1"
            exit 1
            ;;
    esac
done

sudo apt install tmux vim wget git curl htop nvtop gpg python3-pip -y
if [[ -n "$USER" && -n "$EMAIL"  ]]; then
    git config --global user.name "$USER"	
    git config --global user.email "$EMAIL"
    echo -e "\nUpdate git config user settings.\n"
else
    echo -e "\nSkip git config user settings. Empty arguments.\n"
fi

git config --global core.editor "vim"
git config --global init.defaultBranch main

# Install zsh and set it as default
sudo apt install zsh -y
chsh -s $(which zsh)

# Install oh-my-zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# INSTALL powerlevel10k
plevel10k_dir="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$plevel10k_dir"

replace_theme="powerlevel10k/powerlevel10k"
sed -i "s|^ZSH_THEME=\".*\"|ZSH_THEME=\"$replace_theme\"|" "$HOME/.zshrc"	

# Install zsh extensions
completions_dir="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-completions"
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
autosuggestions_dir="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

highlighting_dir="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

sed -i "s|^plugins=.*|plugins=( git zsh-completions zsh-autosuggestions zsh-syntax-highlighting )|" "$HOME/.zshrc"	

