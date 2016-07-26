" execute pathogen#infect()

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
let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-3024
" let g:airline_theme='base16_default'

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set tabstop=2
set expandtab
set laststatus=2

filetype plugin on
filetype indent on

set list listchars=tab:\ \ ,trail:·

" Markdown for .md files.
au BufNewFile,BufRead *.md set filetype=markdown

set nowrap
set linebreak

