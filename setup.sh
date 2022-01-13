#!/usr/bin/env bash

# set up the initial install for my development machine
set -o errexit
set -o nounset
set -o pipefail

# install homebrew
if ! command -v brew &>/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# brew install
echo "Install/Update Homebrew packages? [y/N]"
read -r brew_install

if [[ "${brew_install}" == "y" ]] || [[ "${brew_install}" == "Y" ]]; then
    /usr/local/bin/brew update --force
    /usr/local/bin/brew bundle || true
fi

# install oh-my-zsh
if ! [[ -d ~/.oh-my-zsh ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# install vundle
if ! git rev-parse ~/.vim/bundle/Vundle.vim &>/dev/null; then
    mkdir -p ~/.vim/bundle
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# install livedown for md preview
if ! command -v livedown &>/dev/null; then
    npm install -g livedown
fi

# install rvm
if ! command -v rvm &>/dev/null; then
    gpg --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
    curl -sSL https://get.rvm.io | bash -s stable
fi

# symlink files
for dotfile in .finicky.js .gitconfig .gitignore_global .gvimrc .vimrc .zshrc; do
    ln -sfn "$(pwd)/${dotfile}" ~/${dotfile}
done

mkdir -p ~/{.config,.vim,.vim/swapfiles,.zshrc.d}

ln -sfn "$(pwd)/.config/pep8" ~/.config/pep8
ln -sfn "$(pwd)/.config/yamllint" ~/.config/yamllint
ln -sfn "$(pwd)/.vim/plugin-settings" ~/.vim/plugin-settings
ln -sfn "$(pwd)/.vim/wrappers" ~/.vim/wrappers

echo "Setup is complete. The system should be rebooted to complete the process."
