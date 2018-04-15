#
# User configuration sourced by interactive shells
#

# Change default zim location
export ZIM_HOME="${ZDOTDIR:-${HOME}}/.zim"

# Start zim
[[ -s "${ZIM_HOME}/init.zsh" ]] && source "${ZIM_HOME}/init.zsh"

export PATH="~/bin:${PATH}"

umask 027

# editor/visual/pager
export EDITOR=vim
export VISUAL=vim
export PAGER=less

## Go shell variables
export GOPATH="${HOME}/go"
export PATH="${GOPATH}/bin:${PATH}"

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

base16_3024

# colored grep
alias grep='grep --color=auto'

# make watch always work with colored input
alias watch='watch --color'

# ALIASES

# ls
alias ll='ls -lh'

# vi (go FreeBSD)
alias vi='vim'

if [[ -x `which htop` ]]; then alias top="htop"; fi

# vim - load tmp/current.vim if it exist and no params to vim are passed (aka vim is aliased to v)
function v() {
if (( $# == 0 )) && [[ -f tmp/current.vim ]]; then
  vim -S tmp/current.vim
else
  vim "$@"
fi
}

# misc
alias diff='colordiff -u'
alias screen='TERM=screen-256color screen'

# tmux stuff
alias tmux='TERM=screen-256color tmux'

# Python2 on macOS to make my life easier
[[ "$(uname)" == "Darwin" ]] && alias python2=/usr/bin/python2.7

# GLOBAL ALIASES

alias -g C='| wc -l'
alias -g G='| grep'
alias -g L='| less'
alias -g M='| more'
alias -g S='&> /dev/null'

# COMMAND COMPLETION
#
## treat `#', `~' and `^' characters as part of patterns for filename generation
#setopt extended_glob
#
## if command not found, but directory found, cd into this directory
#setopt auto_cd
#
## turn off automatic matching of ~/ directories (speeds things up)
#setopt no_cdable_vars
#
## perform implicit tees or cats when multiple redirections are attempted
#setopt multios
#
## do not send the HUP signal to backround jobs on shell exit
#setopt no_hup
#
## parameter expansion, command substitution and arithmetic expansion are performed in prompts
#setopt prompt_subst
#
## speed-up the git completion for filenames
#__git_files () {
#  _wanted files expl 'local files' _files
#}
#
## fuzzy matching for typos
#zstyle ':completion:*' completer _complete _match _approximate
#zstyle ':completion:*:match:*' original only
#zstyle ':completion:*:approximate:*' max-errors 1 numeric
#
## cd will never select parent
#zstyle ':completion:*:cd:*' ignore-parents parent pwd
#
## tab completion for PIDs
#zstyle ':completion:*:*:*:*:processes' command "ps -u `whoami` -o pid,user,comm,command -w -w"
#zstyle ':completion:*:*:kill:*' menu yes select
#zstyle ':completion:*:kill:*' force-list always
#
## zsh completions chache
#CACHEDIR="$HOME/.zsh/cache"
#
## create $CACHEDIR if it does not exist
#if [ ! -d $CACHEDIR ]; then
#  mkdir -p $CACHEDIR
#fi
#
## cache completions
#zstyle ':completion:*' use-cache on
#zstyle ':completion:*' cache-path $CACHEDIR
#
## load completions
#autoload -U compinit
#compinit -d $CACHEDIR/zcompdump
#
## If a pattern for filename generation has no matches, print an error,
## instead of leaving it unchanged in the argument list. This also
## applies to file expansion of an initial ~ or =.
#unsetopt nomatch

# ZLE WIDGETS

# Zsh's history-beginning-search-backward is very close to Vim's C-x C-l
history-beginning-search-backward-then-append() {
  zle history-beginning-search-backward
  zle vi-add-eol
}
zle -N history-beginning-search-backward-then-append

# Delete all characters between a pair of characters. Mimics vim's "di" text object functionality
function delete-in {

# Create locally-scoped variables we'll need
local CHAR LCHAR RCHAR LSEARCH RSEARCH COUNT

# Read the character to indicate which text object we're deleting
read -k CHAR

if [ "$CHAR" = "w" ]
then
  # diw, delete the word

  # find the beginning of the word under the cursor
  zle vi-backward-word

  # set the left side of the delete region at this point
  LSEARCH=$CURSOR

  # find the end of the word under the cursor
  zle vi-forward-word

  # set the right side of the delete region at this point
  RSEARCH=$CURSOR

  # Set the BUFFER to everything except the word we are removing
  RBUFFER="$BUFFER[$RSEARCH+1,${#BUFFER}]"
  LBUFFER="$LBUFFER[1,$LSEARCH]"

  return

  # diw was unique.  For everything else, we just have to define the
  # characters to the left and right of the cursor to be removed
elif [ "$CHAR" = "(" ] || [ "$CHAR" = ")" ] || [ "$CHAR" = "b" ]
then
  # di), delete inside of a pair of parenthesis
  LCHAR="("
  RCHAR=")"

elif [ "$CHAR" = "[" ] || [ "$CHAR" = "]" ]
then
  # di], delete inside of a pair of square brackets
  LCHAR="["
  RCHAR="]"

elif [ $CHAR = "{" ] || [ $CHAR = "}" ] || [ "$CHAR" = "B" ]
then
  # di}, delete inside of a pair of braces
  LCHAR="{"
  RCHAR="}"

else
  # The character entered does not have a special definition.
  # Simply find the first instance to the left and right of the cursor.
  LCHAR="$CHAR"
  RCHAR="$CHAR"
fi

# Find the first instance of LCHAR to the left of the cursor and the
# first instance of RCHAR to the right of the cursor, and remove everything in between.
# Begin the search for the left-sided character directly the left of the cursor
LSEARCH=${#LBUFFER}

# Keep going left until we find the character or hit the beginning of the buffer
while [ "$LSEARCH" -gt 0 ] && [ "$LBUFFER[$LSEARCH]" != "$LCHAR" ]
do
  LSEARCH=$(expr $LSEARCH - 1)
done

# If we hit the beginning of the command line without finding the character, abort
if [ "$LBUFFER[$LSEARCH]" != "$LCHAR" ]
then
  return
fi

# start the search directly to the right of the cursor
RSEARCH=0

# Keep going right until we find the character or hit the end of the buffer
while [ "$RSEARCH" -lt $(expr ${#RBUFFER} + 1 ) ] && [ "$RBUFFER[$RSEARCH]" != "$RCHAR" ]
do
  RSEARCH=$(expr $RSEARCH + 1)
done

# If we hit the end of the command line without finding the character, abort
if [ "$RBUFFER[$RSEARCH]" != "$RCHAR" ]
then
  return
fi

# Set the BUFFER to everything except the text we are removing
RBUFFER="$RBUFFER[$RSEARCH,${#RBUFFER}]"
LBUFFER="$LBUFFER[1,$LSEARCH]"
}

zle -N delete-in

# Delete all characters between a pair of characters and then go to insert mode
# Mimics vim's "ci" text object functionality.
function change-in {
zle delete-in
zle vi-insert
}
zle -N change-in

# Delete all characters between a pair of characters as well as the surrounding
# characters themselves. Mimics vim's "da" text object functionality
function delete-around {
zle delete-in
zle vi-backward-char
zle vi-delete-char
zle vi-delete-char
}
zle -N delete-around

# Delete all characters between a pair of characters as well as the surrounding
# characters themselves and then go into insert mode. Mimics vim's "ca" text object functionality.
function change-around {
zle delete-in
zle vi-backward-char
zle vi-delete-char
zle vi-delete-char
zle vi-insert
}
zle -N change-around

# vim mode indicator in prompt (http://superuser.com/questions/151803/how-do-i-customize-zshs-vim-mode)
vim_ins_mode="%F{cyan}[INS]$fx[reset]"
vim_cmd_mode="%F{green}[CMD]$fx[reset]"
vim_mode=$vim_ins_mode

function zle-keymap-select {
vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-finish {
vim_mode=$vim_ins_mode
}
zle -N zle-line-finish

# Fix a bug when you C-c in CMD mode and you'd be prompted with CMD mode indicator, while in fact you would be in INS mode
# Fixed by catching SIGINT (C-c), set vim_mode to INS and then repropagate the SIGINT, so if anything else depends on it, we will not break it
#function TRAPINT() {
#  vim_mode=$vim_ins_mode
#  return $(( 128 + $1 ))
#}

#autoload -U promptinit && promptinit
PURE_CMD_MAX_EXEC_TIME=60
#prompt pure

RPROMPT='${vim_mode}'

# don't display RPROMPT for previously accepted lines; only display it next to current line
setopt transient_rprompt


# KEY BINDINGS

# 200ms wait (20 == 200ms) for a longer bound string (usually ESC + something; wait 200ms for 'something' and if it doesn't come, just execute normal <Esc>)
export KEYTIMEOUT=20

# VIM style keybindings by default
bindkey -v

# make backward-word and forward-word move to each word separated by a '/'
export WORDCHARS=''

# edit command line
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

alias ←="pushd -q +1"
alias →="pushd -q -0"

case "$TERM" in
  *xterm*|screen-256color)
    # alt + arrows
    bindkey '[D' backward-word
    bindkey '[C' forward-word
    bindkey '^[[1;3D' backward-word
    bindkey '^[[1;3C' forward-word

    # ctrl + arrows
    bindkey '^[OD' backward-word
    bindkey '^[OC' forward-word
    bindkey '^[[1;5D' backward-word
    bindkey '^[[1;5C' forward-word

    # home / end
    bindkey '^[[1~' beginning-of-line
    bindkey '^[[4~' end-of-line

    # delete
    bindkey '^[[3~' delete-char

    # page up / page down
    bindkey '^[[5~' history-beginning-search-backward
    bindkey '^[[6~' history-beginning-search-forward

    # shift + tab
    bindkey '^[[Z' reverse-menu-complete


    # VI MODE KEYBINDINGS (ins mode)
    bindkey -M viins '^a'    beginning-of-line
    bindkey -M viins '^e'    end-of-line
    bindkey -M viins -s '^b' "←\n" # C-b move to previous directory (in history)
    bindkey -M viins -s '^f' "→\n" # C-f move to next directory (in history)
    bindkey -M viins '^k'    kill-line
    bindkey -M viins '^r'    history-incremental-pattern-search-backward
    bindkey -M viins '^s'    history-incremental-pattern-search-forward
    bindkey -M viins '^o'    history-beginning-search-backward
    bindkey -M viins '^p'    history-beginning-search-backward
    bindkey -M viins '^n'    history-beginning-search-forward
    bindkey -M viins '^y'    yank
    bindkey -M viins '^w'    backward-kill-word
    bindkey -M viins '^u'    backward-kill-line
    bindkey -M viins '^h'    backward-delete-char
    bindkey -M viins '^?'    backward-delete-char
    bindkey -M viins '^_'    undo
    bindkey -M viins '^x^l'  history-beginning-search-backward-then-append
    bindkey -M viins '^x^r'  redisplay
    bindkey -M viins '\eOH'  beginning-of-line # Home
    bindkey -M viins '\eOF'  end-of-line       # End
    bindkey -M viins '\e[2~' overwrite-mode    # Insert


    # VI MODE KEYBINDINGS (cmd mode)
    bindkey -M vicmd 'ca'    change-around
    bindkey -M vicmd 'ci'    change-in
    bindkey -M vicmd 'da'    delete-around
    bindkey -M vicmd 'di'    delete-in
    bindkey -M vicmd 'ga'    what-cursor-position
    bindkey -M vicmd 'gg'    beginning-of-history
    bindkey -M vicmd 'G '    end-of-history
    bindkey -M vicmd '^a'    beginning-of-line
    bindkey -M vicmd '^e'    end-of-line
    bindkey -M vicmd '^k'    kill-line
    bindkey -M vicmd '^r'    history-incremental-pattern-search-backward
    bindkey -M vicmd '^s'    history-incremental-pattern-search-forward
    bindkey -M vicmd '^o'    history-beginning-search-backward
    bindkey -M vicmd '^p'    history-beginning-search-backward
    bindkey -M vicmd '^n'    history-beginning-search-forward
    bindkey -M vicmd '^y'    yank
    bindkey -M vicmd '^w'    backward-kill-word
    bindkey -M vicmd '^u'    backward-kill-line
    bindkey -M vicmd '/'     vi-history-search-backward
    bindkey -M vicmd '?'     vi-history-search-forward
    bindkey -M vicmd '^_'    undo
    bindkey -M vicmd '\ef'   forward-word                      # Alt-f
    bindkey -M vicmd '\eb'   backward-word                     # Alt-b
    bindkey -M vicmd '\ed'   kill-word                         # Alt-d
    bindkey -M vicmd '\e[5~' history-beginning-search-backward # PageUp
    bindkey -M vicmd '\e[6~' history-beginning-search-forward  # PageDown
    ;;
esac


# SPELLING CORRECTIONS
#
## limit correction only to commands
#setopt correct
#
## When offering typo corrections, do not propose anything which starts with an underscore (such as many of Zsh's shell functions)
#CORRECT_IGNORE='_*'
#
## general exceptions
#for i in {'cp','git','gist','man','mv','mysql','mkdir'}; do
#  alias $i="nocorrect $i"
#done
#
## ruby/rails exceptions
#for i in {'bundle','cap','capify','cucumber','foreman','gem','guard','heroku','puma','pry','rake','rspec','ruby','spec','spork','thin'}; do
#  alias $i="nocorrect $i"
#done
#


# SMART URLS
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

# display CPU usage stats for commands taking more than 10 seconds
REPORTTIME=10

# make less more friendly for non-text input files, see lesspipe(1)
[[ -x /usr/bin/lesspipe ]] && eval "$(lesspipe)"

# set DISPLAY if Xvfb is running (expects it to run on :0)
[[ -x /usr/bin/xdpyinfo ]] && xdpyinfo -display :0 &> /dev/null && export DISPLAY=:0

[[ -s "${HOME}/.iterm2_shell_integration.zsh" ]] && source ${HOME}/.iterm2_shell_integration.zsh
[[ -x /usr/local/bin/ponysay ]] && ponysay -b round "Welcome to the bananastand!"

# powerline-go
function powerline_precmd() {
  PS1="$(~/go/bin/powerline-go -error $? -newline -colorize-hostname -shell zsh)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [[ "$TERM" != "linux" ]]; then
    install_powerline_precmd
fi


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/lexpierce/.sdkman"
[[ -s "/home/lexpierce/.sdkman/bin/sdkman-init.sh" ]] && source "/home/lexpierce/.sdkman/bin/sdkman-init.sh"
