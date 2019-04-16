export SHELL=/bin/bash
export EDITOR=/usr/bin/vim

export GOPATH=$HOME/go
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

case $- in
    *i*) ;;
      *) return ;;
esac

#Prompt building

case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

#Color vars

R="\[\033[0m\]"
U="\[\033[0;38;5;166m\]"
H="$U\[\033[1m\]"
D="$U\[\033[2m\]"
E="\[\033[0;38;5;094m\]"

if [ "$color_prompt" = yes ]; then
    PS1="$U\u$H@\h:$D\w $E#$R "
else
    PS1="\u@\h:\w # "
fi

HISTCONTROL=ignoreboth #Ignore duplicate lines or lines starting with space

shopt -s histappend #Append history to history file
shopt -s checkwinsize #Update windsize after each command
shopt -s globstar #Globstar matches subdirectories

#History size

HISTSIZE=1000
HISTFILESIZE=2000

#LS ALIASES
export LS_OPTIONS='-F --color=auto'
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias la='ls $LS_OPTIONS -lA'
#GREP ALIASES
alias grep="grep --color=auto"

alias ssh-config="cat ~/.ssh/config"

alias oldpwd='echo $OLDPWD'

alias apt="sudo apt"

source /etc/bash_completion

