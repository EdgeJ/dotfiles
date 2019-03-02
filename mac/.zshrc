# Path to your oh-my-zsh installation.
export ZSH=/Users/jedge/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="spaceship"

# theme settings
SPACESHIP_EXEC_TIME_SHOW=false
SPACESHIP_DIR_TRUNC=0
SPACESHIP_DIR_TRUNC_REPO=false

# enable plugins
plugins=(aws brew catimg git-extras jsontools rake osx z)

source $ZSH/oh-my-zsh.sh

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

# jenv Java management
eval "$(jenv init -)"

# add to the PATH for jenv and homebrewed binaries
export PATH="${HOME}/.jenv/bin/:/usr/local/sbin:${PATH}"

# default editor settings
export EDITOR=/usr/bin/vim
export SUDO_EDITOR="${EDITOR} -u NORC"

# Source locally managed zsh configs
for config in ~/.zshrc.d/*(.); do
    source $config
done
