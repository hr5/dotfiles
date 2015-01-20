# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=100000
setopt autocd extendedglob
autoload -U colors && colors
bindkey -e

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename ${HOME}/.zshrc

autoload -Uz compinit
compinit
# End of lines added by compinstall

source ~/.scripts/config.sh

PROMPT="
%{$fg[green]%}%n%{$reset_color%} at %{$fg[yellow]%}%M%{$reset_color%} in %{$fg[blue]%}%~%{$reset_color%}
> "

