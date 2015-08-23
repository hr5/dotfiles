#History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt incappendhistory sharehistory

setopt dotglob autocd nomatch notify extendedglob
bindkey -e

# Custom completion settings
zstyle ':completion:*' completer _expand _complete _ignored _match _correct _approximate _prefix
zstyle ':completion:*' expand suffix
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]} r:|[._-]=** r:|=**'
zstyle ':completion:*' max-errors 1
zstyle ':completion:*' original true
zstyle ':completion:*' select-prompt ''
zstyle :compinstall filename ${HOME}/.zshrc

autoload -Uz compinit
compinit

source ~/.config/sh/config.sh

#Keys
bindkey "^[[A" up-line-or-search
bindkey "^[[B" down-line-or-search

#Prompt
autoload -U colors && colors
PROMPT="%{$fg[red]%}%~ %{$fg[blue]%}» %{$reset_color%}"
