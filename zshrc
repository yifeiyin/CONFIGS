export ZSH="/Users/yyin/.oh-my-zsh"
export ZSH_CUSTOM="$ZSH/custom"
ZSH_THEME="pi"

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    vi-mode
)

export MANPATH="/usr/local/man:$MANPATH"
export EDITOR='vim'
alias vimr="vim -R"


# University SSH
export UNISSH="USER@HOST.EXAMPLE.COM"
alias unissh="ssh $UNISSH"


# For edit rc file and re-source it immediately
vimzshrc() { vim ~/.zshrc && source ~/.zshrc }

# Load NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


# function taken from https://gist.github.com/LukeSmithxyz/e62f26e55ea8b0ed41a65912fbebbe52
# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'


# CASE_SENSITIVE="true"         # case-sensitive completion
# HYPHEN_INSENSITIVE="true"     # hyphen-insensitive completion
                                # Case-sensitive completion must be off.
                                # _ and - will be interchangeable.
# DISABLE_AUTO_TITLE="true"     # disable auto-setting terminal title.
ENABLE_CORRECTION="true"        # command auto-correction
COMPLETION_WAITING_DOTS="true"  # display red dots whilst waiting for completion.

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

source $ZSH/oh-my-zsh.sh

