# Enable colors in Terminal
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Throttle internet connection on specified port
function _throttleon {
    sudo ipfw pipe 1 config bw $1KBytes/s
    sudo ipfw add 1 pipe 1 src-port $2
}
alias throttleon=_throttleon
alias throttleoff='sudo ipfw delete 1'
