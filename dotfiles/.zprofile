#!/bin/zsh

export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

source ~/.bin/zsh-autoenv/autoenv.zsh

alias ll='ls -alGh'

alias defaultsdiff='/Users/victor/repos/victorlin/macos-defaults/diff.sh'

# media-related aliases
alias yt-mp3='yt-dlp --extract-audio --audio-format mp3'
alias yt-mp4='yt-dlp -S +hdr -S ext:mp4:m4a'
alias spherify='exiftool -overwrite_original -XMP-GPano:ProjectionType="equirectangular"'

function git-prunelocal()
{
    git fetch --all --prune
    git branch --v | grep "\[gone\]" | awk '{print $1}' | xargs git branch -D
}

# prevent some git force pushes
# https://stackoverflow.com/a/59283949
function git() {
    if [[ $@ == 'push -f'* || $@ == 'push --force '*  ]]; then
        echo Hey stupid, use --force-with-lease instead
    else
        command git "$@"
    fi
}

# custom ls colors
# disabled because it doesn't work well with light background
# export LSCOLORS=GxFxCxDxBxegedabagaced

# allow comments
setopt interactivecomments

# ignore duplicates in command history
setopt histignoredups

# Vim key bindings
# https://superuser.com/a/1759614
# bindkey -v
# bindkey -v '^?' backward-delete-char

# enable option+delete
# https://unix.stackexchange.com/a/319854
backward-kill-dir () {
    # remove slash from WORDCHARS so directories can be deleted incrementally
    local WORDCHARS=${WORDCHARS/\/}
    zle backward-kill-word
    zle -f kill
}
zle -N backward-kill-dir
bindkey '^[^?' backward-kill-dir

# enable option+arrows
# https://unix.stackexchange.com/a/258661
autoload -U select-word-style
select-word-style bash

# Move prompt to bottom
printf '\n%.0s' {1..100}
function clear() {
    command clear;
    printf '\n%.0s' {1..100};
}

# custom prompt
update_prompt() {
    # Indicate conda env: https://unix.stackexchange.com/a/680112
    if [[ -n $CONDA_DEFAULT_ENV ]]; then
        CONDA_ENV="* "
    else
        CONDA_ENV=""
    fi

    NEWLINE=$'\n'
    # Other fun symbols: ▷ ▸ │
    PROMPT="${NEWLINE}▶ $CONDA_ENV%1~ ▷ "
}
precmd_functions+=( update_prompt )
setopt prompt_subst
