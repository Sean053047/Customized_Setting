#!/bin/zsh
sudo apt install -y python3-pip
sudo apt install -y libsqlite3-dev python3-tk tk-dev
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
pip3 install pipenv --user

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc 
source ~/.zshrc
