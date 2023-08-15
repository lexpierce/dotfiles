# .bashrc

# Source global definitions
[[ -f /etc/bashrc ]] && . /etc/bashrc

# User specific aliases and functions

[[ $- != *i* ]] && return

alias ls="ls -FG --color=auto"

# COLORS
#
# colored grep
alias grep='grep --color=auto'

# make watch always work with colored input
alias watch='watch --color'

export PS1="\[\033[01;32m\][\u] \[\033[01;34m\]\w \$ \[\033[00m\]"
[[ "${SSH_CONNECTION}" != '' ]] && export PS1="\[\033[01;32m\][\u@\h] \[\033[01;34m\]\w \$ \[\033[00m\]"

set -o ignoreeof
set -o vi

shopt -s cdspell
shopt -s extglob

alias lsa='ls -A'
alias ll='ls -lh'
alias 7z='7za'
alias sudo='PATH=/usr/sbin:/sbin:${PATH} sudo'
alias gpg=gpg2
alias vi=vim
alias more=less

# eval "$(starship init bash)"

# A Windows-style prompt.  Good for laughs!
# export PS1='C:${PWD//\//\\\}>'
# vim:ts=2:sw=2
