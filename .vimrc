call plug#begin('~/.vimplugged')
	" Plugins that require specific, newer versions of vim
	if v:version > 800
		Plug 'dense-analysis/ale'
	endif
	Plug 'chriskempson/base16-vim'
	Plug 'preservim/tagbar'
	Plug 'godlygeek/tabular'
	Plug 'cespare/vim-toml'
	Plug 'plasticboy/vim-markdown'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'rust-lang/rust.vim'
	Plug 'Glench/Vim-Jinja2-Syntax'
	Plug 'hashivim/vim-hashicorp-tools'
	Plug 'vmchale/ion-vim'
	Plug 'ziglang/zig.vim'
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

silent !mkdir ~/.vim/backups
set undodir=~/.vim/backups
set undofile

let g:airline_theme='base16_marrakesh'

" Anisble settings
let g:ansible_unindent_after_newline=1

" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1

let g:vim_markdown_folding_disabled=1

" ALE options for Rust
let g:ale_linters= {'rust': ['analyzer']}
let g:ale_rust_cargo_use_clippy = executable('cargo-clippy')
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace'],'rust': ['rustfmt']}

" rust.vim options
let g:rustfmt_autosave = 1

let g:tagbar_ctags_bin = 'universal-ctags'

set autoindent
set smartindent
set smarttab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set noexpandtab
set laststatus=2

filetype plugin on
filetype indent on

autocmd FileType yaml setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab

set list listchars=tab:\ \ ,trail:·

" Markdown for .md files.
au BufNewFile,BufRead *.md set filetype=markdown

set nowrap
set linebreak

