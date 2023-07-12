-- lua/plugins/specs/editor.lua
--
--  ┌
--  │             Plugins for enhancing the editor
--  └

return {
	{
		"lewis6991/gitsigns.nvim",
		opts = function()
			return require("plugins.configs.editor.gitsigns")
		end,
		config = true,
		init = function()
			require("core.utils.lazy")("gitsigns.nvim")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function()
			return require("plugins.configs.treesitter.configs")
		end,
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)

			vim.schedule(function()
				require("nvim-treesitter.configs").setup({
					indent = {
						enable = true,
					},
				})
			end)
		end,
		init = function()
			require("core.utils.lazy")("nvim-treesitter")
		end,
		build = ":TSUpdate",
	},
}
