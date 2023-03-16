# Path management helper funcs
addpathprefix() {
    if [[ $# -ne 1 ]]; then
        return
    fi
    export PATH="${1}:${PATH}"
}

addpathsuffix() {
    if [[ $# -ne 1 ]]; then
        return
    fi
    export PATH="${PATH}:${1}"
}

rempath() {
    if [[ $# -ne 1 ]]; then
        return
    fi
    export PATH="${PATH/${1}:/}"
}

# figure out what dist type we're on
case $(uname -s) in
    Darwin)
        DIST=mac
        DISTPLUGINS=(brew macos)
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

# Setup homebrew if installed
if command -v brew &>/dev/null; then
    # Add homebrew completions
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

    # docker autocomplete
    if [[ -d /Applications/Docker.app ]] && [[ ! -f $(brew --prefix)/share/zsh/site-functions/docker* ]]; then
        ln -sfn /Applications/Docker.app/Contents/Resources/etc/*.zsh-completion $(brew --prefix)/share/zsh/site-functions/
    fi

    addpathprefix "$(brew --prefix)/bin"
fi

# Set name of the theme to load.
ZSH_THEME="spaceship"

# theme settings
SPACESHIP_EXEC_TIME_SHOW=false
SPACESHIP_DIR_TRUNC=0
SPACESHIP_DIR_TRUNC_REPO=false
SPACESHIP_KUBECTL_SHOW=true
SPACESHIP_KUBECTL_VERSION_SHOW=false
SPACESHIP_KUBECONTEXT_COLOR=yellow
SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  golang        # Go section
  docker        # Docker section
  kubectl
  venv          # virtualenv section
  ruby
  terraform     # Terraform workspace section
  line_sep      # Line break
  char          # Prompt character
)


## autosuggest settings
ZSH_AUTOSUGGEST_STRATEGY=(completion history)
ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_AUTOSUGGEST_HISTORY_IGNORE="cd *"

# enable plugins

plugins=(
    asdf
    aws
    docker
    git-extras
    helm
    jsontools
    kubectl
    rake
    z
    zsh-autosuggestions
    $DISTPLUGINS[@]
)

# paths for oh-my-zsh installation
export ZSH=${HOME}/.oh-my-zsh
export ZSH_CUSTOM=${ZSH}/custom

# install autosuggestions plugin
if ! git -C "${ZSH_CUSTOM}/plugins/zsh-autosuggestions" rev-parse &>/dev/null; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
fi

# install spaceship-prompt theme
if ! git -C "${ZSH_CUSTOM}/themes/spaceship-prompt" rev-parse &>/dev/null; then
    git clone https://github.com/denysdovhan/spaceship-prompt.git \
        "$ZSH_CUSTOM/themes/spaceship-prompt"
    ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" \
        "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
fi

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
alias mybranches="git branch -r | grep ${USER}"
alias forcepush="git push --force-with-lease"
alias curl="noglob curl"
alias readme="livedown start README.md --open --browser \"'google chrome'\" &|"
alias dockerconnect="nc -U ~/Library/Containers/com.docker.docker/Data/debug-shell.sock"

cleanup-git-branches() {
    local ruby_cmd=$(
        cat <<'EOF'
local_branches = `git branch`.split
local_branches.delete('*')
remote_branches = `git branch -r`.split
remote_branches.each { |branch| branch.gsub!('origin/', '') }

local_branches.each do |branch|
  system('git', 'branch', '-D', branch) unless remote_branches.include? branch
end
EOF
    )

    ruby -e "${ruby_cmd}"
}

switch-go() {
    local go_version=$1
    local go_cmd="go${go_version}"
    local default_gopath=${HOME}/go

    if [[ "${go_version:-unset}" == "unset" ]]; then
        printf "Missing version. Expected semver or \"latest\".\n"
        return 1
    fi
    if [[ "${go_version}" == "latest" ]]; then
        rempath "${GOROOT}/bin"
        rempath "${GOPATH}/bin"
        addpathsuffix "${default_gopath}/bin"
        unset GOROOT
        unset GOPATH
        return 0
    fi
    if ! command -v ${go_cmd} &>/dev/null; then
        go install golang.org/dl/go${go_version}@latest &&
        ${go_cmd} download
    fi
    export GOROOT=$(${go_cmd} env GOROOT)
    export GOPATH=${HOME}/${go_cmd}

    mkdir -p ${GOPATH}/{bin,pkg,src}
    rempath "${default_gopath}/bin"
    addpathprefix "${GOROOT}/bin"
    addpathprefix "${GOPATH}/bin"
}

# cache terraform providers
if command -v terraform &>/dev/null; then
    export TF_PLUGIN_CACHE_DIR=$HOME/.terraform/plugins
    mkdir -p $TF_PLUGIN_CACHE_DIR
fi

if [[ -d ${HOME}/go/bin ]]; then
    addpathsuffix "${HOME}/go/bin"
fi

if [[ -d ${HOME}/.krew/bin ]]; then
    addpathsuffix "${HOME}/.krew/bin"
fi

# default editor settings
export EDITOR=/usr/bin/vim
export SUDO_EDITOR="${EDITOR} -u NORC"
export KUBE_EDITOR="${EDITOR} -u NORC"

# don't paginate if text fits one screen
export PAGER='less -FX'
