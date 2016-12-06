export CONFPATH=$HOME/.config/sh

alias ls='ls --color=auto'
alias cmake='cmake -G "Unix Makefiles"'
alias ll='ls -l -h'
alias tar='tar --format="pax"'
alias grep='grep --color=auto'
alias objdump='objdump -Mintel'
alias cdtemp='cd $(mktemp -d)'

. $CONFPATH/termcolor.sh
