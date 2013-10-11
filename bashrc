# .bashrc

# Source global definitions
[[ -f /etc/bashrc ]] && . /etc/bashrc

# User specific aliases and functions

[[ $- != *i* ]] && return

alias ls="ls -FG"
    
export PS1="\[\033[01;32m\][\u] \[\033[01;34m\]\w 🍔  \[\033[00m\]"
# case $TERM in
#   xterm*|rxvt|Eterm|eterm|Terminal|terminal)
#    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"' ;;
#   screen)
#    PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\033\\"' ;;
# esac

set -o ignoreeof
set -o vi

shopt -s cdspell
shopt -s extglob

alias lsa='ls -A'
alias ll='ls -lh'
alias 7z='7za'
alias sudo='PATH=/usr/sbin:/sbin:$PATH sudo'
alias gpg=gpg2
alias vi=vim
alias more=less

# A Windows-style prompt.  Good for laughs!
# export PS1='C:${PWD//\//\\\}>'
cd
# vim:ts=4:sw=4
