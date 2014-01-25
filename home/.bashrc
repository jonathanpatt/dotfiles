# Set uname variable
platform=`uname`

# Initialize rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

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

if [ -f $HOME/Documents/proj/personal/code/Scripts/xmlb2html/xmlb2html.py ]; then
    alias xmlb2html="python $HOME/Documents/proj/personal/code/Scripts/xmlb2html/xmlb2html.py $1"
fi

alias g="git"
alias gs="git status"

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
