#
# User configuration sourced by interactive shells
#

# Set an initial fpath for non-included completions
fpath=($fpath ${HOME}/.zsh/completions/)

# Define zim location
export ZIM_HOME="${ZDOTDIR:-${HOME}}/.zim"

# Start zim
[[ -s "${ZIM_HOME}/init.zsh" ]] && source "${ZIM_HOME}/init.zsh"


export PATH="~/bin:${PATH}"

umask 022

# editor/visual/pager
export EDITOR=vim
export VISUAL=vim
export PAGER=less

## Go shell variables
export GOPATH="${HOME}/go"
export PATH="${GOPATH}/bin:/usr/local/go/bin:${PATH}"

## Fix key timeout for vi-mode
export KEYTIMEOUT=2

# make cd push the old directory onto the directory stack
setopt auto_pushd

# Report the status of background jobs immediately, rather than waiting until just before printing a prompt.
setopt notify

# Turn off terminal driver flow control (CTRL+S/CTRL+Q)
setopt noflowcontrol
stty -ixon -ixoff

# Do not kill background processes when closing the shell.
setopt nohup

# Script language PATHS

export PYTHONPATH=~/lib/python
export RUBYLIB=~/lib/ruby

# COLORS
#
BASE16_SHELL="${HOME}/.config/base16-shell/"
[[ -n "$PS1" ]] && [[ -s "${BASE16_SHELL}/profile_helper.sh" ]] && eval "$(${BASE16_SHELL}/profile_helper.sh)"

base16_marrakesh

# colored grep
alias grep='grep --color=auto'

# make watch always work with colored input
alias watch='watch --color'

# ALIASES

# ls
alias ll='ls -lh'

if [[ -x `which htop` ]]; then alias top="htop"; fi

# misc
alias diff='colordiff -u'
alias screen='TERM=screen-256color screen'

# tmux stuff
alias tmux='TERM=screen-256color tmux'

# SMART URLS
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

# display CPU usage stats for commands taking more than 10 seconds
REPORTTIME=10

# make less more friendly for non-text input files, see lesspipe(1)
[[ -x /usr/bin/lesspipe ]] && eval "$(lesspipe)"

# set DISPLAY if Xvfb is running (expects it to run on :0)
[[ -x /usr/bin/xdpyinfo ]] && xdpyinfo -display :0 &> /dev/null && export DISPLAY=:0

# [[ -s "${HOME}/.iterm2_shell_integration.zsh" ]] && source ${HOME}/.iterm2_shell_integration.zsh
[[ -x /usr/local/bin/ponysay ]] && ponysay -b round "Welcome to $(hostname -s)!"

## powerline-go
#function powerline_precmd() {
#  PS1="$(~/go/bin/powerline-go -error $? -colorize-hostname -modules venv,vgo,git,hg,newline,user,host,ssh,newline,cwd,perms,jobs,exit -shell zsh)"
#}
#
#function install_powerline_precmd() {
#  for s in "${precmd_functions[@]}"; do
#    if [ "$s" = "powerline_precmd" ]; then
#      return
#    fi
#  done
#  precmd_functions+=(powerline_precmd)
#}
#
#if [[ "$TERM" != "linux" ]]; then
#    install_powerline_precmd
#fi

[[ -x /usr/local/bin/thefuck ]] && eval $(thefuck --alias)

# Completion for kitty
[[ -x ${HOME}/bin/kitty ]] && kitty + complete setup zsh | source /dev/stdin

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="${HOME}/.sdkman"
[[ -s "${SDKMAN_DIR}/bin/sdkman-init.sh" ]] && source "${SDKMAN_DIR}/bin/sdkman-init.sh"

