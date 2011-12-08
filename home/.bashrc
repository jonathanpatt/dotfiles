# Todo alias
alias todo="todo.sh"

# Enable colors in Terminal
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Throttle internet connection on specified port
# Example:
#           throttleon 75 80
# Throttles port 80 to 75kbps
function _throttleon {
    sudo ipfw pipe 1 config bw $1KBytes/s
    sudo ipfw add 1 pipe 1 src-port $2
}
alias throttleon=_throttleon
alias throttleoff='sudo ipfw delete 1'

# Get character count of HTML/XML file, sans tag content
alias wc_book="set -e 's/<[^>]*>//g' $1 | wc -m"