set -aUx FZF_DEFAULT_COMMAND fd --type file --follow --hidden --exclude .git --color=always
set -aUx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
