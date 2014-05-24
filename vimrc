set nocompatible
set number
set history=500
set showcmd
set showmode
set visualbell
set autoread
syntax on
set incsearch
set hlsearch

silent !mkdir ~/.vim/backups
set undodir=~/.vim/backups
set undofile
set background=dark
colorscheme base16-tomorrow

set autoindent
set smartindent
set smarttab
set shiftwidth=4
set tabstop=4
set expandtab

filetype plugin on
filetype indent on

set list listchars=tab:\ \ ,trail:·

set nowrap
set linebreak

