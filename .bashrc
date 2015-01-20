#
# ~/.bashrc
#

shopt -s autocd
shopt -s dirspell
shopt -s extglob
shopt -s cdspell

HISTSIZE=-1

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

. ~/.scripts/termcolor
. ~/.scripts/config.sh

#PS1="\[$Green\]\w \[$Yellow\]»\[${cr}\] "
#PS1="\n\[$Purple\]\u \[$cr\]at \[$Yellow\]\h \[$cr\]in \[$Cyan\]\w\[$cr\]\n$ "
#PS1="\[$Blue\]»\[$cr\] "
PS1="[\[$Blue\]\u\[$cr\]@\[$Green\]\h\[$cr\]]-[\w] "
