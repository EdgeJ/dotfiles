#!/usr/bin/env bash

# set up the initial install for my development machine
set -o errexit
set -o nounset
set -o pipefail

prompt () {
    printf -- "%s [y/N]\n" "$*"
    read -r ans
    if [[ "${ans}" == "y" ]] || [[ "${ans}" == "Y" ]]; then
        return 0
    fi
    return 1
}

# install homebrew
if ! command -v brew &>/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# brew install
if prompt "Install/Update Homebrew packages?"; then
    /opt/homebrew/bin/brew update --force
    /opt/homebrew/bin/brew bundle || true
fi

# install oh-my-zsh
if ! [[ -d ~/.oh-my-zsh ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# install vim-plug
if ! [[ -f ~/.vim/autoload/plug.vim ]]; then
    mkdir -p ~/.vim/autoload
    curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
if ! [[ -f "${XDG_DATA_HOME:-$HOME}/.local/share/nvim/site/autoload/plug.vim" ]]; then
    mkdir -p "${XDG_DATA_HOME:-$HOME}/.local/share/nvim/site/autoload/"
    curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# install livedown for md preview
if prompt "Install livedown?"; then
    npm install -g livedown
fi

# install docker-langserver for vim completions
if prompt "Install docker-langserver?"; then
    npm install -g dockerfile-language-server-nodejs
fi

# install hacked fonts for iterm, powerline, vim
if prompt "Install hacked fonts?"; then
    FONT_TEMP="$(mktemp -d)"
    pushd "${FONT_TEMP}"
    curl -fsSLO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Monofur.zip
    curl -fsSLOhttps://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/RobotoMono.zip
    unzip Monofur.zip
    unzip RobotoMono.zip
    find . -name '*.ttf' -exec cp {} ~/Library/Fonts/ \;

    git clone git@github.com:powerline/fonts.git --depth=1
    pushd fonts && ./install.sh
    popd && popd
fi

# symlink files
for dotfile in .finicky.js .gitconfig .gitconfig-github .gitignore_global .gvimrc .vimrc .zshrc; do
    ln -sfn "$(pwd)/${dotfile}" ~/${dotfile}
done

mkdir -p ~/{.config,.vim,.vim/swapfiles,.zshrc.d}

ln -sfn "$(pwd)/.config/pep8" ~/.config/pep8
ln -sfn "$(pwd)/.config/yamllint" ~/.config/yamllint
ln -sfn "$(pwd)/.config/nvim" ~/.config/nvim
ln -sfn "$(pwd)/.vim/plugin-settings" ~/.vim/plugin-settings
ln -sfn "$(pwd)/.vim/wrappers" ~/.vim/wrappers

echo "Setup is complete. The system should be rebooted to complete the process."
