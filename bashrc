export TERM="xterm-256color"


export PS1="\n\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[34;1m\]\W\[\033[m\]\$ "
export PAGER='less -R'
export EDITOR='vim'

alias ll='ls -alH'
alias vimr='vim -R'

function vimrc() {
    vim ~/.bashrc && source ~/.bashrc
}

alias gs='git status'
alias gc='git commit -v'
alias gco='git checkout'
alias gp='git push'
alias gpf='git push --force-with-lease'
alias gpff='git push --force'

