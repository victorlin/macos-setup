#!/bin/zsh

# brew
eval "$(/opt/homebrew/bin/brew shellenv)"

export PATH="$HOME/.bin:$PATH"

alias ll='ls -alGh'

alias defaultsdiff='/Users/victor/repos/victorlin/macos-defaults/diff.sh'

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
export LSCOLORS=GxFxCxDxBxegedabagaced

# allow comments
setopt interactivecomments

# ignore duplicates in command history
setopt histignoredups

# https://unix.stackexchange.com/a/319854
backward-kill-dir () {
    # remove slash from WORDCHARS so directories can be deleted incrementally
    local WORDCHARS=${WORDCHARS/\/}
    zle backward-kill-word
    zle -f kill
}
zle -N backward-kill-dir
bindkey '^[^?' backward-kill-dir

# enable tab completions
# https://stackoverflow.com/a/58517668
autoload -Uz compinit
FPATH=~/.bin/conda-zsh-completion:$FPATH
compinit

# https://unix.stackexchange.com/a/258661
# move over and edit words in the manner of bash
autoload -U select-word-style
select-word-style bash

# Move prompt to bottom
printf '\n%.0s' {1..100}
function clear() {
    command clear;
    printf '\n%.0s' {1..100};
}
