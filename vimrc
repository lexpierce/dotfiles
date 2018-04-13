call plug#begin('~/.vimplugged')
Plug 'SirVer/ultisnips'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/base16-vim'
Plug 'pearofducks/ansible-vim', { 'do': 'cd ./UltiSnips; python2 generate.py' }
Plug 'cespare/vim-toml'
Plug 'elixir-editors/vim-elixir'
call plug#end()

set nocompatible
filetype off
" let &runtimepath.=',~/.vim/bundle/ale'
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
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
endif

let g:airline_theme='base16_3024'
let g:ansible_unindent_after_newline=1

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

