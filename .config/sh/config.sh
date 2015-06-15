export CONFPATH=$HOME/.config/sh

export TERMINAL="urxvt"
export EDITOR="vim"
export PAGER="less"

export LOCALPATH=$HOME/local
export PKG_CONFIG_PATH=$LOCALPATH/lib/pkgconfig
export LD_LIBRARY_PATH=$LOCALPATH/lib

export MANPATH=$LOCALPATH/share/man
export GOPATH=$LOCALPATH/share/go
export CHICKEN_REPOSITORY=$LOCALPATH/lib/cs

export PATH=$PATH:$HOME/.gem/ruby/2.2.0/bin

alias ls='ls --color=auto'
alias cmake='cmake -G "Unix Makefiles"'
alias ll='ls -l -h'
alias tar='tar --format="posix"'
alias grep='grep --color=auto'
alias objdump='objdump -Mintel'

. $CONFPATH/termcolor.sh
