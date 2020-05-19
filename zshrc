export ZSH="/Users/yyin/.oh-my-zsh"
export ZSH_CUSTOM="$ZSH/custom"
export PATH="/Users/yyin/yy/bin:$PATH"
export MANPATH="/usr/local/man:$MANPATH"
export EDITOR='vim'
export ZSH_THEME="pi"
export PREFERRED_TERMINAL="iTerm2"  # One of iTerm2 or Terminal, personal use only

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    vi-mode
    docker
    docker-compose
)

# For option explainations, check original template:
# https://github.com/ohmyzsh/ohmyzsh/blob/master/templates/zshrc.zsh-template
# CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="true"
# DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"   # makes VCS status check faster for large repo


source "$ZSH/oh-my-zsh.sh"


# Custom Aliases
alias vimr="vim -R"


# University SSH
export UNISSH="yinyife2@mathlab.utsc.utoronto.ca"
alias unissh="ssh $UNISSH"


########################## Utility Tools ##########################

### For edit rc file and re-source it immediately
vimzshrc() { vim ~/.zshrc && source ~/.zshrc }


### Terminal file manager: lf https://github.com/gokcehan/lf
# Use lf to switch directories and bind it to ctrl-o
# function taken from https://gist.github.com/LukeSmithxyz/e62f26e55ea8b0ed41a65912fbebbe52
lfcd() {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^O' 'lfcd\n'


### Command line fuzzy finder: fzf https://github.com/junegunn/fzf#installation
[ -f "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"


########################## Other Tools ##########################


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
eval "$(pyenv init -)"
export PATH="$PATH:/Users/yyin/.local/bin"


### Node version maanger: nvm https://github.com/nvm-sh/nvm#installing-and-updating
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
