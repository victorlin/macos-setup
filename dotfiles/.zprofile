#!/bin/zsh

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
    PROMPT="${NEWLINE}▶ [%*] $CONDA_ENV%1~ ▷ "
}
precmd_functions+=( update_prompt )
setopt prompt_subst

# Keep time in prompt up to date
# https://stackoverflow.com/a/17915260
TMOUT=1
TRAPALRM() {
    zle reset-prompt
}

export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

alias ll='ls -alGh'

alias defaultsdiff='/Users/victor/repos/victorlin/macos-defaults/diff.sh'

# media-related aliases
alias yt-mp3='yt-dlp --extract-audio --audio-format mp3 --no-mtime'
alias yt-mp4='yt-dlp -S +hdr -S ext:mp4:m4a --no-mtime'
alias exif-info='exiftool -duplicates -groupNames:1 -short -extractEmbedded --printConv'
alias spherify='exiftool -overwrite_original -XMP-GPano:ProjectionType="equirectangular"'
alias exif-add-go3-set-pdt='exiftool -overwrite_original -Keys:Make="Insta360" -Keys:Model="GO 3" -AllDates+=7 -VideoDates+=7'
alias exif-add-go3-set-pst='exiftool -overwrite_original -Keys:Make="Insta360" -Keys:Model="GO 3" -AllDates+=8 -VideoDates+=8'
alias exif-add-go3='exiftool -overwrite_original -Keys:Make="Insta360" -Keys:Model="GO 3"'
alias exif-add-gopro='exiftool -overwrite_original -Keys:Make=GoPro "-Keys:Model<GoPro:Model"'
alias export-editor='osxphotos export --library ~/Pictures/editor.photoslibrary/ --skip-original-if-edited --exiftool --no-exportdb -- ~/Pictures/export'

function exif-copy() {
    local from="$1"
    local to="$2"

    exiftool \
        -quiet \
        -TagsFromFile "$from" \
        -all:all \
        -overwrite_original \
        "$to"
}

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

# Untracked section below
