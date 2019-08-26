call plug#begin('~/.vimplugged')
Plug 'plytophogy/vim-virtualenv'
" Plugins that require specific, newer versions of vim
if v:version > 800
  Plug 'SirVer/ultisnips'
  Plug 'w0rp/ale'
endif
Plug 'chriskempson/base16-vim'
Plug 'godlygeek/tabular'
Plug 'pearofducks/ansible-vim', { 'do': 'cd ./UltiSnips; python2 generate.py' }
Plug 'cespare/vim-toml'
Plug 'elixir-editors/vim-elixir'
Plug 'kchmck/vim-coffee-script'
Plug 'plasticboy/vim-markdown'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rust-lang/rust.vim'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'isobit/vim-caddyfile'
Plug 'hashivim/vim-hashicorp-tools'
call plug#end()

set nocompatible
filetype off
set number
set history=500
set showcmd
set showmode
set visualbell
set autoread
syntax on
set incsearch
set hlsearch

silent!mkdir ~/.vim/backups
set undodir=~/.vim/backups
set undofile
set background=dark
let g:base16_shell_path='~/.config/base16-shell/scripts'
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

let g:airline_theme='base16_marrakesh'
let g:ansible_unindent_after_newline=1

" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1

let g:vim_markdown_folding_disabled=1

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

