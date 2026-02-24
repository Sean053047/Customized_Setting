#!/bin/bash

USER=""
EMAIL=""
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --user)
            USER="$2"
            shift 2
            ;;
        --email)
            EMAIL="$2"
            shift 2
            ;;
        *)
            echo "Unknown parameter passed: $1"
            exit 1
            ;;
    esac
done

sudo apt install tmux vim wget git curl htop nvtop gpg python3-pip nvtop -y
if [[ -n "$USER" && -n "$EMAIL"  ]]; then
    git config --global user.name "$USER"	
    git config --global user.email "$EMAIL"
    echo -e "\nUpdate git config user settings.\n"
else
    echo -e "\nSkip git config user settings. Empty arguments.\n"
fi

git config --global core.editor "vim"
git config --global init.defaultBranch main

# Install git credential
wget https://github.com/git-ecosystem/git-credential-manager/releases/download/v2.6.0/gcm-linux_amd64.2.6.0.deb
sudo dpkg -i gcm-linux_amd64*.deb
rm gcm-linux_amd64*.deb
git-credential-manager configure


# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all