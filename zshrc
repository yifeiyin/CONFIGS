#!/usr/bin/env zsh

plugins=(
    git-prompt
    zsh-autosuggestions
    zsh-syntax-highlighting
    vi-mode
    docker
    docker-compose
)

export ZSH="/Users/yyin/.oh-my-zsh"
export ZSH_CUSTOM="$ZSH/custom"
export ZSH_THEME="pi"

# Adapted from original template:
# https://github.com/ohmyzsh/ohmyzsh/blob/master/templates/zshrc.zsh-template
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"

source "$ZSH/oh-my-zsh.sh"

##############################################################

[ -f "$HOME/.sh_aliases" ] && source "$HOME/.sh_aliases"

########################## Personal ##########################

# University SSH
export UNISSH="yinyife2@mathlab.utsc.utoronto.ca"
alias unissh="ssh $UNISSH"

# password-store
export PASSWORD_STORE_GENERATED_LENGTH=16
export PASSWORD_STORE_CHARACTER_SET='[:alnum:]\!\@\#\$\%\^\&\*\(\)\-\=\[\]\;\,\.\/\?'
export PASSWORD_STORE_CHARACTER_SET_NO_SYMBOLS='[:alnum:]'

# scripts
export YY_SCRIPTS=~/Developer/SCRIPTS
function qnote() {
    FILE='/tmp/qnote_editing.md'
    pushd /Users/yyin/Developer/quick-notes > /dev/null
    if vim -c 'startinsert' "$FILE" && ./new < "$FILE"; then
        rm -f "$FILE"
        git add -A
        git commit -m "Add new quick note using qnote"
        git fetch
        git rebase
        git push
    else
        echo "Stopped"
    fi
    popd > /dev/null
}

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


########################## Other Tools ##########################

### PostgreSQL
export PGDATA='/usr/local/var/postgres'

### Android Studio https://developer.android.com/studio
export ANDROID_SDK="/Users/yyin/Library/Android/sdk"
export PATH="/Users/yyin/Library/Android/sdk/platform-tools:$PATH"


### Haskell ghcup https://www.haskell.org/ghcup/
# Official doc uses GHCUP_INSTALL_BASE_PREFIX first, then fallback to $HOME/.ghcup
# [ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env"
export PATH="$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH"
export fpath=($fpath "$HOME/.ghcup/etc")  # auto complete


### Python environment manager: pyenv https://github.com/pyenv/pyenv#installation
# PYENV_ROOT="~/.pyenv" (This is the default)
export PATH="/Users/yyin/.local/bin:$PATH"
eval "$(pyenv init -)"


### Node version maanger: nvm https://github.com/nvm-sh/nvm#installing-and-updating
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


### Command line fuzzy finder: fzf https://github.com/junegunn/fzf#installation
[ -f "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"


### macOS unlock keychain
if which security > /dev/null; then
    function unlock() {
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

export QNOTE=~/Developer/quick-notes/src/posts
function qnotef () {
    cd $QNOTE
    egrep -i "$1" ~/Developer/quick-notes/src/posts/*.md
    cd -
}

function qnoteft() {
    qnotef title: | sed 's|.*posts/||g' | sed 's/.md:title:/:/g' | egrep -i "$1"
}

function qnotee() {
    cd $QNOTE
    vim $(find . -type f -name '*'"$1"'*')
    cd -
}

function ipgeo () {
    curl -s "https://ipinfo.io/$1" | jq
}

