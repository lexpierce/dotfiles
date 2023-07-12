return {
	flavour = "macchiato",
	term_colors = true,
	integrations = {
		cmp = true,
		dashboard = false,
		alpha = false,
		gitsigns = true,
		nvimtree = false,
		telescope = false,
		treesitter = true,
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "undercurl" },
				hints = { "undercurl" },
				warnings = { "undercurl" },
				information = { "undercurl" },
			},
		},
		dap = {
			enabled = false,
			enable_ui = false, -- enable nvim-dap-ui
		},
		notify = true,
		dropbar = {
			enabled = false,
			color_mode = false, -- enable color for kind's texts, not just kind's icons
		},
	},
}
