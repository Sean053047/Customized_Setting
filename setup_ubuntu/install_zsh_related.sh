#! /bin/zsh
project_path=$(dirname $(dirname $(realpath $0)))

rm -rf ~/.oh-my-zsh ~/.zshrc ~/.zprofile ~/.p10k.zsh

sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


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

cp "$project_path/file/.p10k.zsh" ~/.p10k.zsh
echo "[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh" >> ~/.zshrc