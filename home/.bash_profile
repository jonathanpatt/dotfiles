if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

if which brew > /dev/null; then
    if [ -f `brew --prefix`/etc/bash_completion ]; then
        . `brew --prefix`/etc/bash_completion
    fi
fi

. ~/.profile
. ~/.bashrc
