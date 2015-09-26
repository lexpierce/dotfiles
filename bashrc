# .bashrc

# Source global definitions
[[ -f /etc/bashrc ]] && . /etc/bashrc

# User specific aliases and functions

[[ $- != *i* ]] && return

alias ls="ls -FG --color=auto"

# COLORS
#
export BASE16_SCHEME=bright
# Base16 Shell
BASE16_SHELL="$HOME/.zsh/base16-${BASE16_SCHEME}.dark.sh"
[[ -s $BASE16_SHELL ]] && . $BASE16_SHELL

export PS1="\[\033[01;32m\][\u] \[\033[01;34m\]\w \$ \[\033[00m\]"
[[ "${SSH_CONNECTION}" != '' ]] && export PS1="\[\033[01;32m\][\u@\h] \[\033[01;34m\]\w \$ \[\033[00m\]"
# [[ `uname -n` == "Darwin" ]] && export PS1="\[\033[01;32m\][\u] \[\033[01;34m\]\w 🍔  \[\033[00m\]"

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
