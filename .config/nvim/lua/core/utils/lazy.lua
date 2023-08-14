return function(plugin)
	vim.api.nvim_create_autocmd({ "BufRead", "BufWinEnter", "BufNewFile", "WinEnter" }, {
		callback = function()
			if vim.fn.expand("%") ~= "" then
				-- dont defer for treesitter as it will show slow highlighting
				-- This deferring only happens only when we do "nvim filename"
				if plugin ~= "nvim-treesitter" then
					vim.schedule(function()
						require("lazy").load({ plugins = plugin })

						if plugin == "nvim-lspconfig" or plugin == "vim-matchup" then
							vim.cmd("silent! do FileType")
						end
					end)
				else
					require("lazy").load({ plugins = plugin })
				end
			end
		end,
	})
end
