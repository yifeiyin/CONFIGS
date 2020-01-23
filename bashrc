export PS1="\n\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[34;1m\]\W\[\033[m\]\$ "
export TERM="xterm-256color"
export PAGER='less -R'
export EDITOR='vim'

alias ll='ls -al'
alias vimr='vim -R'

C() {
    #  input_file_name  output_file_name  no_delete
    if [ -z "$2" ]; then
        OUTPUT_FILE_TMP=$(echo "$1" | sed 's/\.c//g')
        OUTPUT_FILE="${OUTPUT_FILE_TMP}__c_compile_tmp"
    else
        OUTPUT_FILE="$2"
    fi

    gcc -Wall -o "$OUTPUT_FILE" "$1" && "./$OUTPUT_FILE"
    if [ $? == 0 ] && [ -z "$2" ]; then
        trash "./$OUTPUT_FILE"
    else
        echo ""
        echo "[info] File kept: $OUTPUT_FILE"
    fi
}
