#!/usr/bin/env bash

###############################
# Prompt
###############################

#### Simple prompt
export PS1='\n\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h\[\033[m\]:\[\033[34;1m\]\W\[\033[m\]\$ '

#### Prompt with exit code and git info (branch + status)
function shell_prompt_exit_code() {
    __x=$?
    [[ $__x -ne 0 ]] && echo -e "$__x "
}

function shell_prompt_git_branch() {
    __x=$(git symbolic-ref --short HEAD 2>/dev/null)
    if [[ -n "$__x" ]]; then
        if [[ -z "$(git status --porcelain 2>/dev/null)" ]]; then
            echo -e "$__x"
        else
            echo -e "$__x*"
        fi
    fi
}

export PS1='\n\[\033[38;5;9m\]$(shell_prompt_exit_code)\[\033[m\]\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h\[\033[m\]:\[\033[34;1m\]\W\[\033[m\] \[\033[35m\]$(shell_prompt_git_branch)\[\033[m\]\$ '

###############################
# Vim mode
###############################

set -o vi
