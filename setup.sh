#!/usr/bin/env bash

# set up the initial install for my development machine
set -o errexit
set -o nounset
set -o pipefail

# brew install
/usr/local/bin/brew update --force
/usr/local/bin/brew bundle || true

# install oh-my-zsh
if ! [[ -d ~/.oh-my-zsh ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# install vundle
if ! git rev-parse ~/.vim/bundle/Vundle.vim &>/dev/null; then
    mkdir -p ~/.vim/bundle
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# symlink files
for dotfile in .gitconfig .gitignore_global .gvimrc .vimrc .zshrc; do
    ln -sfn "$(pwd)/${dotfile}" ~/${dotfile}
done

# install livedown for md preview
npm install -g livedown

mkdir -p ~/{.config,.vim,.zshrc.d}

ln -sfn "$(pwd)/.config/pep8" ~/.config/pep8
ln -sfn "$(pwd)/.vim/plugin-settings" ~/.vim/plugin-settings
ln -sfn "$(pwd)/.vim/wrappers" ~/.vim/wrappers

# install rvm
gpg --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable

# install python tools
pip install -r requirements.txt

echo "Setup is complete. The system should be rebooted to complete the process."
