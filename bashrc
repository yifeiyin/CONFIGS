export TERM="xterm-256color"

#### Pager and editor
export PAGER='less -Ri'
export EDITOR='vim'

#### Simple prompt
export PS1='\n\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h\[\033[m\]:\[\033[34;1m\]\W\[\033[m\]\$ '

#### Prompt with exit code and git info (branch + status)
function shell_prompt_exit_code() {
    __x=$?
    [[ $__x -ne 0 ]] && echo -e "\033[38;5;9m$__x\033[m "
}

function shell_prompt_git_branch() {
    __x=$(git symbolic-ref --short HEAD 2>/dev/null)
    if [[ -n "$__x" ]]; then
        if [[ -z "$(git status --porcelain 2>/dev/null)" ]]; then
            echo -e " \033[38;5;2m$__x\033[m"
        else
            echo -e " \033[38;5;9m$__x\033[m"
        fi
    fi
}

export PS1='\n$(shell_prompt_exit_code)\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h\[\033[m\]:\[\033[34;1m\]\W\[\033[m\]$(shell_prompt_git_branch)\$ '

#### Vim mode
set -o vi

#### Utility
alias ll='ls -alH'
alias vimr='vim -R'

function vimrc() {
    vim ~/.bashrc && source ~/.bashrc
}

#### Git alias
alias gs='git status'

alias ga='git add'
alias gaa='git add -A'

alias gc='git commit -v'

alias gco='git checkout'

alias gp='git push'
alias gpf='git push --force-with-lease'
alias gpff='git push --force'

alias grb='git rebase'
alias grbi='git rebase --interactive'
alias grbc='git rebase --continue'
alias grba='git rebase --abort'

alias gwt='git worktree'
alias gbr='git branch'
