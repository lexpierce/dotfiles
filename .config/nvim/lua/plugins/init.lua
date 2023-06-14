local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ import = "plugins.specs" }, {
	defaults = {
		-- PERF: Lazy-load by default.
		lazy = true,
		-- NOTE: Use the latest version of the plugin. (screw semantic versioning)
		-- version = false,
	},
	checker = {
		-- automatically check for plugin updates
		enabled = true,
		concurrency = nil, ---@type number? set to 1 to check for updates very slowly
		notify = true, -- get a notification when new updates are found
		frequency = 86400, -- check for updates every hour
	},
	install = {
		-- NOTE: Install missing plugins.
		missing = true,
		colorscheme = { "catppuccin" },
	},
	ui = {
		icons = {
			-- Unicode, not Nerd fonts...
			cmd = "⌘",
			config = "🛠 ",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝 ",
			plugin = "🔌",
			runtime = "💻",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})
 
