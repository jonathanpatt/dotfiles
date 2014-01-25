# Set uname variable
platform=`uname`

# Initialize rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Add heroku to path
if which heroku > /dev/null; then
    export PATH="/usr/local/heroku/bin:$PATH"
fi

# Enable 256 colors in xterm
if [ -n "$DISPLAY" -a "$TERM" == "xterm" ]; then
    export TERM=xterm-256color
fi

# Get character count of HTML/XML file, sans tag content
alias wc_book="set -e 's/<[^>]*>//g' $1 | wc -m"

# History search
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

# Find duplicates below current directory
alias find_dup="find * -exec basename {} \; | \
    sed 's/\(.*\)\..*/\1/' | sort | uniq -d"

alias g="git"
alias gs="git status"

# Download video and convert to MP3 file
if which youtube-dl > /dev/null; then
    alias yt2mp3="youtube-dl --extract-audio --audio-format=mp3 -t"
fi


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
