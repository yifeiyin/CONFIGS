#!/usr/bin/env zsh

plugins=(
#    git-prompt
#    zsh-autosuggestions
#    zsh-syntax-highlighting
    vi-mode
#    docker
#    docker-compose
)

export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$ZSH/custom"
export ZSH_THEME="pi"

# Adapted from original template:
# https://github.com/ohmyzsh/ohmyzsh/blob/master/templates/zshrc.zsh-template
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"

source "$ZSH/oh-my-zsh.sh"

# https://github.com/Homebrew/homebrew-core/blob/master/Formula/zsh-syntax-highlighting.rb
# brew install zsh-syntax-highlighting
if [ -f "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
    source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
elif [ -f "/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
    echo 'Consider running "brew install zsh-syntax-highlighting"'
fi


##############################################################

[ -f "$HOME/.sh_aliases" ] && source "$HOME/.sh_aliases"


########################## Utility Tools ##########################

### Use ctrl-z to suspend current command
# Taken from https://unix.stackexchange.com/a/74381
fancy-ctrl-z () {
  emulate -LR zsh
  if [[ $#BUFFER -eq 0 ]]; then
    bg
    zle redisplay
  else
    zle push-input
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

alias watch='watch '  # https://unix.stackexchange.com/a/25329


########################## Tools ##########################

### PostgreSQL
export PGDATA='/usr/local/var/postgres'


### Python environment manager: pyenv https://github.com/pyenv/pyenv#installation
# PYENV_ROOT="~/.pyenv" (This is the default)
if type "pyenv" > /dev/null; then
  export PATH="/Users/yyin/.local/bin:$PATH"
  eval "$(pyenv init -)"
fi

### Node version manager: nvm https://github.com/nvm-sh/nvm#installing-and-updating
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

### Command line fuzzy finder: fzf https://github.com/junegunn/fzf#installation
[ -f "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"


### Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "/Users/yyin/.bun/_bun" ] && source "/Users/yyin/.bun/_bun"

### macOS unlock keychain
if which security > /dev/null; then
    function unlock_keychain() {
        if $(security unlock -p 123 2> /dev/null); then
            echo 'Already unlocked'
        else
            security unlock
        fi
    }
fi


### GPG
if which gpg > /dev/null; then
    # See https://unix.stackexchange.com/q/257061
    export GPG_TTY=$(tty)
    export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
    eval "$(gpg-agent --daemon 2> /dev/null)"

    # See https://gpgtools.tenderapp.com/kb/faq/enter-passphrase-with-pinentry-in-terminal-via-ssh-connection
    if [[ -n "$SSH_CONNECTION" ]] ;then
        export PINENTRY_USER_DATA="USE_CURSES=1"
    fi
fi


### IP address to location
function ipgeo () {
    curl -s "https://ipinfo.io/$1" | jq
}

