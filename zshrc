#
# User configuration sourced by interactive shells
#

# -----------------
# Zsh configuration
# -----------------

#
# History
#

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

#
# Input/output
#

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -v

# Prompt for spelling correction of commands.
setopt CORRECT

# Customize spelling correction prompt.
SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

# --------------------
# Module configuration
# --------------------

#
# completion
#

# Set an initial fpath for non-included completions
fpath=(${fpath} ${HOME}/.zsh/completions/)

# Set a custom path for the completion dump file.
# If none is provided, the default ${ZDOTDIR:-${HOME}}/.zcompdump is used.
zstyle ':zim:completion' dumpfile "${ZDOTDIR:-${HOME}}/.zcompdump-${ZSH_VERSION}"

#
# input
#

# Append `../` to your input for each `.` you type after an initial `..`
zstyle ':zim:input' double-dot-expand yes

#
# termtitle
#

# Set a custom terminal title format using prompt expansion escape sequences.
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
# If none is provided, the default '%n@%m: %~' is used.
zstyle ':zim:termtitle' format '%1~'

#
# zsh-autosuggestions
#

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'

#
# zsh-syntax-highlighting
#

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets cursor)

# Customize the main highlighter styles.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[comment]='fg=10'

#
# ssh
#

keys=($(ls ~/.ssh | grep -v -E "(\.pub|known_hosts|config|authorized_keys|\.pem)"))
zstyle ':zim:ssh' ids $keys

# ------------------
# Initialize modules
# ------------------

if [[ ${ZIM_HOME}/init.zsh -ot ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
	# Update static initialization script if it's outdated, before sourcing it
	source ${ZIM_HOME}/zimfw.zsh init -q
fi
source ${ZIM_HOME}/init.zsh

# ------------------------------
# Post-init module configuration
# ------------------------------

#
# zsh-history-substring-search
#

# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Bind up and down keys
zmodload -F zsh/terminfo +p:terminfo
if [[ -n ${terminfo[kcuu1]} && -n ${terminfo[kcud1]} ]]; then
	bindkey ${terminfo[kcuu1]} history-substring-search-up
	bindkey ${terminfo[kcud1]} history-substring-search-down
fi

bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

export PATH="${HOME}/bin:${PATH}"

umask 022

# editor/visual/pager
export EDITOR=vim
export VISUAL=vim
export PAGER=less

## Go shell variables
export GOPATH="${HOME}/go"
export PATH="${GOPATH}/bin:${PATH}"

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

export PYTHONPATH="${HOME}/lib/python"
export RUBYLIB="${HOME}/lib/ruby"

# COLORS
#
BASE16_SHELL="${HOME}/.config/base16-shell/"
[[ -n "$PS1" ]] && [[ -s "${BASE16_SHELL}/profile_helper.sh" ]] && eval "$(${BASE16_SHELL}/profile_helper.sh)"

# Cargo env - Rustup
[[ -e "${HOME}/.cargo/env" ]] && source "${HOME}/.cargo/env"

# colored grep
alias grep='grep --color=auto'

# make watch always work with colored input
alias watch='watch --color'


# ALIASES

# ls
whence lsd > /dev/null && alias ls='lsd --date=relative --icon=never'
alias ll='ls -lh'


# misc
whence colordiff > /dev/null && alias diff='colordiff -u'
whence btm > /dev/null && alias top='btm'
alias screen='TERM=screen-256color screen'
alias tmux='TERM=screen-256color tmux'

# SMART URLS
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

# display CPU usage stats for commands taking more than 10 seconds
REPORTTIME=10

# Completion for kitty
whence kitty > /dev/null && kitty + complete setup zsh | source /dev/stdin

whence ponysay > /dev/null && ponysay -b round "Welcome to $(hostname -s)!"

# Set color
sleep 1 && base16_marrakesh

## Setup for various shell prompts

### powerline-go
#function powerline_precmd() {
#	PS1="$(~/go/bin/powerline-go -error $? -colorize-hostname -modules venv,vgo,git,hg,newline,user,host,ssh,newline,cwd,perms,jobs,exit -shell zsh)"
#}
#
#function install_powerline_precmd() {
#	for s in "${precmd_functions[@]}"; do
#		if [ "$s" = "powerline_precmd" ]; then
#			return
#		fi
#	done
#	precmd_functions+=(powerline_precmd)
#}
#
#if [[ "$TERM" != "linux" ]]; then
#	install_powerline_precmd
#fi

### P10K
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

### Zoxide
whence zoxide > /dev/null && eval "$(zoxide init --hook pwd zsh)"

### Starship
whence starship > /dev/null && eval "$(starship init zsh)"
