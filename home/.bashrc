# Set uname variable
platform=`uname`

# Initialize rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Initialize homebrew
if which brew > /dev/null; then
    PATH=/usr/local/bin:$PATH
    PATH=/usr/local/sbin:$PATH
    PATH=/usr/local/share/python:$PATH

    if [ -f `brew --prefix`/etc/bash_completion ]; then
        . `brew --prefix`/etc/bash_completion
    fi
fi

# Rails environment variables
export DYLD_FALLBACK_LIBRARY_PATH=/Applications/Postgres.app/Contents/MacOS/lib:$DYLD_LIBRARY_PATH

# Enable colors in Terminal
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Enable 256 colors in xterm
if [ -n "$DISPLAY" -a "$TERM" == "xterm" ]; then
    export TERM=xterm-256color
fi

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

if [ -f $HOME/Documents/proj/personal/code/Scripts/xmlb2html/xmlb2html.py ]; then
    alias xmlb2html="python $HOME/Documents/proj/personal/code/Scripts/xmlb2html/xmlb2html.py $1"
fi

alias g="git"
alias gs="git status"

# Homebrew shortcuts
if which brew > /dev/null; then
    alias b="brew"
    alias bu="brew update"
fi

# Download video and convert to MP3 file
if which youtube-dl > /dev/null; then
    alias yt2mp3="youtube-dl --extract-audio --audio-format=mp3 -t"
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Import local .bashrc file if it exists
if [ -f ~/.bashrc_local ]; then
    . ~/.bashrc_local
fi

# Import platform-specific .bashrc files if they exist
if [[ $platform == 'Darwin' ]]; then
    if [ -f ~/.bashrc_osx ]; then
        . ~/.bashrc_osx
    fi
elif [[ $platform == 'Linux' ]]; then
    if [ -f ~/.bashrc_linux ]; then
        . ~/.bashrc_linux
    fi
fi
