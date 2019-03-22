# figure out what dist type we're on
case $(uname -s) in
    Darwin)
        DIST=mac
        DISTPLUGINS=(brew osx)
        ;;
    Linux)
        if [[ $(uname -r) =~ .*Microsoft ]]; then
            DIST=wsl
            DISTPLUGINS=()
        else
            DIST=linux
            DISTPLUGINS=()
        fi
        ;;
    *)
        echo "Could not determine your OS, defaulting to Linux"
        DIST=linux
        DISTPLUGINS=()
        ;;
esac

# load settings for X server when running on Windows Subsystem for Linux
if [[ "${DIST}" == "wsl" ]]; then
    export $(dbus-launch)
    export DISPLAY=:0.0
    export LIBGL_ALWAYS_INDIRECT=1
fi

# Path to your oh-my-zsh installation.
export ZSH=${HOME}/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="spaceship"

# theme settings
SPACESHIP_EXEC_TIME_SHOW=false
SPACESHIP_DIR_TRUNC=0
SPACESHIP_DIR_TRUNC_REPO=false
SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  ruby          # Ruby section
  golang        # Go section
  docker        # Docker section
  venv          # virtualenv section
  terraform     # Terraform workspace section
  line_sep      # Line break
  battery       # Battery level and status
  char          # Prompt character
)

# enable plugins

plugins=(aws catimg git-extras jsontools rake z $DISTPLUGINS[@])

source $ZSH/oh-my-zsh.sh

# install spaceship-prompt theme
# unfortunately must be done after oh-my-zsh has been loaded
# to set $ZSH_CUSTOM
if ! git -C "${ZSH_CUSTOM}/themes/spaceship-prompt" rev-parse &>/dev/null; then
    git clone https://github.com/denysdovhan/spaceship-prompt.git \
        "$ZSH_CUSTOM/themes/spaceship-prompt"
    ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" \
        "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
    source $ZSH/oh-my-zsh.sh
fi

# unset a few oh-my-zsh history opts

unsetopt inc_append_history
unsetopt share_history

# enable zmv for renaming files with regex
autoload -U zmv

# command aliases and functions
alias rm="rm -i"
alias ll="ls -laF"
alias list="ls -lF"
alias h="history | tail -n 10"
alias jump="ssh jump"
alias mybranches="git branch -r | grep ${USER}"
alias cleardrac="find ~/Downloads -name viewer.jnlp\* -delete"

mdch(){
    mkdir "$*"
    cd "$*"
}

is(){
    ps aux | grep -i "$@" | grep -v grep
}

if command -v jenv &>/dev/null; then
    # jenv Java management
    eval "$(jenv init -)"

    # add to the PATH for jenv and homebrewed binaries
    export PATH="${HOME}/.jenv/bin/${PATH}"
fi

if [[ "${DIST}" == "mac" ]]; then
    # add to PATH for homebrewed binaries
    export PATH="/usr/local/sbin:${PATH}"
fi

# default editor settings
export EDITOR=/usr/bin/vim
export SUDO_EDITOR="${EDITOR} -u NORC"

# Source locally managed zsh configs
if [[ $(find ~/.zshrc.d -type f | wc -l) > 0 ]]; then
    for config in ~/.zshrc.d/*; do
        source $config
    done
fi
