call plug#begin()
	Plug 'catppuccin/nvim', {'as': 'catppuccin'}
	Plug 'neovim/nvim-lspconfig'
	Plug 'nvim-tree/nvim-web-devicons'
	Plug 'lewis6991/gitsigns.nvim'
	"Plug 'feline-nvim/feline.nvim'
	Plug 'nvim-lualine/lualine.nvim'
	Plug 'hashivim/vim-terraform'
	Plug 'rust-lang/rust.vim'
	Plug 'lukas-reineke/indent-blankline.nvim'
	Plug 'khaveesh/vim-fish-syntax'
	Plug 'imsnif/kdl.vim'
	Plug 'vmchale/ion-vim'
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	"Plug 'hrsh7th/cmp-nvim-lsp'
	"Plug 'hrsh7th/cmp-buffer'
	"Plug 'hrsh7th/nvim-cmp'
	"Plug 'onsails/lspkind.nvim'
call plug#end() 

set termguicolors
set noshowmode
set nowrap
set ts=4
filetype off
set number
set history=500
set showcmd
set showmode
set visualbell
set linebreak
set autoread
set incsearch
set hlsearch
syntax on

colorscheme catppuccin

highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine
highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine
highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine
highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine
highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine
highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine

let dest = stdpath('data').."/backups"
if !empty(dest)
	if !isdirectory(dest)
		call mkdir(dest, 'p', 0700)
	endif
	echo dest
endif

let &undodir = stdpath('data') .. "/backups"
set undofile

" rust.vim options
let g:rustfmt_autosave = 1
" let g:tagbar_ctags_bin = 'universal-ctags'

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

" set list listchars=trail:·,eol:↴,tab:\ \ 
set list listchars=trail:·,tab:\ \ 

" Markdown for .md files.
au BufNewFile,BufRead *.md set filetype=markdown

lua << END
require("catppuccin").setup({
	flavour = "mocha",
	integrations = {
		indent_blankline = {
			enabled = true,
			colored_indent_levels = false,
		},
	}
})

require("indent_blankline").setup({
	char_highlight_list = {
		"IndentBlanklineIndent1",
		"IndentBlanklineIndent2",
		"IndentBlanklineIndent3",
		"IndentBlanklineIndent4",
		"IndentBlanklineIndent5",
		"IndentBlanklineIndent6",
	},
	show_current_context = true,
	show_current_context_start = true,
})

require('gitsigns').setup {
	signs = {
		add	= {hl = 'GitSignsAdd', text = '│', numhl='GitSignsAddNr'	, linehl='GitSignsAddLn'},
		change = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
		delete = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
		topdelete = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
		changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
	},
	signcolumn = true,	-- Toggle with `:Gitsigns toggle_signs`
	numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
	linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
	word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
	watch_gitdir = {
		interval = 1000,
		follow_files = true
	},
	attach_to_untracked = true,
	current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
		delay = 1000,
		ignore_whitespace = false,
	},
	current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
	sign_priority = 6,
	update_debounce = 100,
	status_formatter = nil, -- Use default
	max_file_length = 40000,
	preview_config = {
		-- Options passed to nvim_open_win
		border = 'single',
		style = 'minimal',
		relative = 'cursor',
		row = 0,
		col = 1
	},
	yadm = {
		enable = false
	},
}
-- Feline Catppuccin integration
-- local ctp_feline = require('catppuccin.groups.integrations.feline')
-- require("feline").setup({
-- 	components = ctp_feline.get(),
-- })
require('lualine').setup({
    options = {
        theme = "catppuccin"
    },
})
END
