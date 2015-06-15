# If not running interactively, don't do anything
[[ $- != *i* ]] && return

shopt -s autocd
shopt -s dirspell
shopt -s extglob
shopt -s cdspell

HISTSIZE=-1

. ~/.config/sh/config.sh

#PS1="\[$IGreen\]\w \[$Cyan\]»\[${cr}\] "
PS1="\[$IGreen\]\w\[$Cyan\] >\[${cr}\] "
