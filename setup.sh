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

# symlink directories
for dotfile in .config .gitconfig .gitignore_global .gvimrc .vimrc .zshrc; do
    ln -sfn $(pwd)/${dotfile} ~/${dotfile}
done

ln -sfn $(pwd)/.vim/plugin-settings ~/.vim/plugin-settings
ln -sfn $(pwd)/.vim/wrappers ~/.vim/wrappers
