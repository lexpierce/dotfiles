call plug#begin()
	Plug 'catppuccin/nvim', {'as': 'catppuccin'}
	Plug 'neovim/nvim-lspconfig'
	Plug 'kyazdani42/nvim-web-devicons'
	Plug 'feline-nvim/feline.nvim'
	Plug 'lewis6991/gitsigns.nvim'
	Plug 'hashivim/vim-terraform'
	Plug 'rust-lang/rust.vim'
	Plug 'lukas-reineke/indent-blankline.nvim'
	Plug 'khaveesh/vim-fish-syntax'
call plug#end() 

set noshowmode
set nowrap
set ts=4
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

let g:catppuccin_flavour = "macchiato" " latte, frappe, macchiato, mocha
colorscheme catppuccin

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

set list listchars=tab:\ \ ,trail:·

" Markdown for .md files.
au BufNewFile,BufRead *.md set filetype=markdown

lua << END
require'lspconfig'.rust_analyzer.setup{}
require("catppuccin").setup {
	transparent_background = false,
	term_colors = false,
	styles = {
		comments = "italic",
		conditionals = "italic",
		loops = "NONE",
		functions = "NONE",
		keywords = "NONE",
		strings = "NONE",
		variables = "NONE",
		numbers = "NONE",
		booleans = "NONE",
		properties = "NONE",
		types = "NONE",
		operators = "NONE",
		},
	integrations = {
		treesitter = true,
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = "italic",
				hints = "italic",
				warnings = "italic",
				information = "italic",
				},
			underlines = {
				errors = "underline",
				hints = "underline",
				warnings = "underline",
				information = "underline",
				},
			},
		lsp_trouble = false,
		cmp = true,
		lsp_saga = false,
		gitgutter = false,
		gitsigns = true,
		telescope = true,
		nvimtree = {
			enabled = true,
			show_root = false,
			transparent_panel = false,
			},
		neotree = {
			enabled = false,
			show_root = false,
			transparent_panel = false,
			},
		which_key = false,
		indent_blankline = {
			enabled = true,
			colored_indent_levels = false,
			},
		dashboard = true,
		neogit = false,
		vim_sneak = false,
		fern = false,
		barbar = false,
		bufferline = true,
		markdown = true,
		lightspeed = false,
		ts_rainbow = false,
		hop = false,
		notify = true,
		telekasten = true,
		symbols_outline = true,
		}
	}
require("indent_blankline").setup()
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
require("feline").setup {
	components = require('catppuccin.core.integrations.feline'),
	}
-- require('lualine').setup {
--   options = {
--     icons_enabled = true,
-- 	theme = 'catppuccin',
--     component_separators = { left = '', right = ''},
--     section_separators = { left = '', right = ''},
--     disabled_filetypes = {},
--     always_divide_middle = true,
--     globalstatus = false,
--   },
--   sections = {
--     lualine_a = {'mode'},
--     lualine_b = {'branch', 'diff', 'diagnostics'},
--     lualine_c = {'filename'},
--     lualine_x = {'encoding', 'fileformat', 'filetype'},
--     lualine_y = {'progress'},
--     lualine_z = {'location'}
--   },
--   inactive_sections = {
--     lualine_a = {},
--     lualine_b = {},
--     lualine_c = {'filename'},
--     lualine_x = {'location'},
--     lualine_y = {},
--     lualine_z = {}
--   },
--   tabline = {},
--   extensions = {}
-- }
END

set linebreak
