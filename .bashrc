#
# ~/.bashrc
#

shopt -s autocd
shopt -s dirspell
shopt -s extglob
shopt -s cdspell

export HISTSIZE=-1

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

alias cmake='cmake -G "Unix Makefiles"'

. ~/.scripts/termcolor


#PS1="\n$Purple\u ${cr}at $Yellow\h ${cr}in $Cyan\w${cr}\n$ "
#PS1="${Blue}»${cr} "
#PS1="[${Blue}\u${cr}@${Green}\h${cr}]-[\w] "
