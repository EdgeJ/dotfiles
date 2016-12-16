# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/jedge/.oh-my-zsh
export EDITOR=/usr/bin/vim
export HOMEBREW_GITHUB_API_TOKEN="0f15dadc4cf09f4a084d97b15990876cee943f53"
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="apple"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh
#
## Set personal aliases, overriding those provided by oh-my-zsh libs,
## plugins, and themes. Aliases can be placed here, though oh-my-zsh
## users are encouraged to define aliases within the ZSH_CUSTOM folder.
## For a full list of active aliases, run `alias`.
##
## Example aliases
## alias zshconfig="mate ~/.zshrc"
## alias ohmyzsh="mate ~/.oh-my-zsh"
## User Aliases and functions
alias rm="rm -i"
alias ll="ls -laF"
alias list="ls -lF"
alias h="history | tail -n 10"
alias jump="ssh jump"

mdch(){
    mkdir "$*"
    cd "$*"
}

is(){
    ps aux | grep -i "$@" | grep -v grep
}


## Keypad
# # 0 . Enter
# bindkey -s "^[Op" "0"
# bindkey -s "^[On" "."
# bindkey -s "^[OM" "^M"
# # 1 2 3
# bindkey -s "^[Oq" "1"
# bindkey -s "^[Or" "2"
# bindkey -s "^[Os" "3"
# # 4 5 6
# bindkey -s "^[Ot" "4"
# bindkey -s "^[Ou" "5"
# bindkey -s "^[Ov" "6"
# # 7 8 9
# bindkey -s "^[Ow" "7"
# bindkey -s "^[Ox" "8"
# bindkey -s "^[Oy" "9"
# # + -  * /
# bindkey -s "^[Ol" "+"
# bindkey -s "^[OS" "-"
# bindkey -s "^[OR" "*"
# bindkey -s "^[OQ" "/"
