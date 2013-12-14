# Rails environment variables
export RACK_ENV=development
export PORT=5000
export DYLD_FALLBACK_LIBRARY_PATH=/Applications/Postgres.app/Contents/MacOS/lib:$DYLD_LIBRARY_PATH

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

# History search
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

# Find duplicates below current directory
alias find_dup="find * -exec basename {} \; | \
    sed 's/\(.*\)\..*/\1/' | sort | uniq -d"

alias xmlb2html="python /Users/jonathan/Documents/proj/personal/code/Scripts/xmlb2html/xmlb2html.py $1"

alias git=hub
alias g="git"
alias gs="git status"
alias b="brew"
alias bu="brew update"

alias yt2mp3="youtube-dl --extract-audio --audio-format=mp3 -t"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
