-- lua/plugins/specs/ui.lua
--
--  ┌
--  │               Plugins that improve the UI
--  └

return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		opts = function()
			return require("plugins.configs.ui.catppuccin")
		end,
		priority = 1000,
		config = true,
	},
	{
		"nvim-lualine/lualine.nvim",
		opts = function()
			return require("plugins.configs.ui.lualine")
		end,
		config = true,
		dependencies = { "nvim-web-devicons" },
		init = function()
			vim.api.nvim_create_autocmd("VimEnter", {
				callback = function()
					local load_lualine = function()
						require("lazy").load({ plugins = "lualine.nvim" })
					end
					if vim.fn.argc() > 1 then
						load_lualine()
					else
						vim.schedule(function()
							load_lualine()
						end)
					end
				end,
			})
		end,
	},
	{
		"folke/noice.nvim",
		opts = function()
			return require("plugins.configs.ui.noice")
		end,
		event = "VeryLazy",
		config = true,
		dependencies = {
			"nui.nvim",
			"nvim-notify",
		},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
--			filetype_exclude = {
--				"help",
--				"alpha",
--				"dashboard",
--				"neo-tree",
--				"Trouble",
--				"lazy",
--				"mason",
--				"notify",
--				"oil_preview",
--			},
		},
		event = "VeryLazy",
	},
	{
		"echasnovski/mini.animate",
		opts = function()
			return require("plugins.configs.ui.animate")
		end,
		config = function(_, opts)
			require("mini.animate").setup(opts)
		end,
		event = "VeryLazy",
	},
	{
		"rcarriga/nvim-notify",
		config = function()
			local stages = require("notify.stages.fade_in_slide_out")("top_down")
			local notify = require("notify")
			notify.setup({
				on_open = function(win)
					vim.api.nvim_win_set_config(win, { focusable = false })
				end,
				stages = {
					function(...)
						local opts = stages[1](...)
						if opts then
							opts.border = "none"
						end
						return opts
					end,
					unpack(stages, 2),
				},
			})
		end,
	},
}
