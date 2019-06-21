#!/usr/bin/env bash

# set up the initial install for my development machine
set -o errexit
set -o nounset
set -o pipefail

# install homebrew
/usr/bin/xcode-select --install && sudo /usr/bin/xcodebuild -license

if git -C /usr/local/Homebrew rev-parse &>/dev/null ||
    [[ -d /usr/local/Homebrew/.git ]]; then
    echo "Clearing existing Homebrew installation"
    rm -rf /usr/local/Homebrew/*
fi

mkdir -p /usr/local/Homebrew
curl --location --silent --fail \
    https://github.com/Homebrew/brew/tarball/master |
    tar xz --strip 1 -C /usr/local/Homebrew
ln -sfn /usr/local/Homebrew/bin/brew /usr/local/bin/brew

# brew install
/usr/local/bin/brew update --force
#/usr/local/bin/brew bundle

# symlink directories
for dotfile in .config .vim .gitconfig .gitignore_global .gvimrc .vimrc .zshrc; do
    ln -sfn $(pwd)/${dotfile} ~/${dotfile}
done
