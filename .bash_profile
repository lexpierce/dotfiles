export GOROOT="${HOME}/go"
export HISTIGNORE="&:[bf]g:exit"
export HISTSIZE=4096
#export LANG="$(locale -a | grep "en_US.[Uu][Tt][Ff]-*8")"
export LC_ALL="${LANG}"
export PATH="${HOME}/bin:${GOROOT}/bin:/usr/local/bin:${PATH}"
# editor/visual/pager
export EDITOR=nvim
export VISUAL=nvim
export PAGER=less



[[ -f ~/.bashrc ]] && source ${HOME}/.bashrc
# vim:ts=4:sw=4
