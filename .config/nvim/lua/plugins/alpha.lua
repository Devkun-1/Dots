-- ~/.config/nvim/lua/plugins/alpha.lua

local add = MiniDeps.add

-- Add alpha-nvim and its icon dependency
add({
	source = "goolord/alpha-nvim",
	depends = { "nvim-tree/nvim-web-devicons" },
})

local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- LazyVim-style ASCII header
-- dashboard.section.header.val = {
-- 	[[                                                     ]],
-- 	[[  ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗]],
-- 	[[  ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║]],
-- 	[[  ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║]],
-- 	[[  ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║]],
-- 	[[  ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║]],
-- 	[[  ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝]],
-- 	[[                                                     ]],
-- }

dashboard.section.header.val = {

	[[                                                                        ]],
	[[    ██╗    ██╗ █████╗ ██╗   ██╗███████╗     ██╗██████╗ ███████╗    ███████╗ ]],
	[[    ██║    ██║██╔══██╗██║   ██║██╔════╝    ███║╚════██╗██╔════╝    ██╔════╝ ]],
	[[    ██║ █╗ ██║███████║██║   ██║█████╗      ╚██║ █████╔╝███████╗    ███████╗ ]],
	[[    ██║███╗██║██╔══██║╚██╗ ██╔╝██╔══╝       ██║██╔═══╝ ╚════██║     ╚═══██║ ]],
	[[    ╚███╔███╔╝██║  ██║ ╚████╔╝ ███████╗     ██║███████╗███████║    ███████║ ]],
	[[     ╚══╝╚══╝ ╚═╝  ╚═╝  ╚═══╝  ╚══════╝     ╚═╝╚══════╝╚══════╝    ╚══════╝ ]],
	[[                                                                        ]],
}
-- Helper: get startup time (shown in footer, like LazyVim)
local function footer()
	local plugin_count = 0

	local ok, entries = pcall(function()
		return vim.fn.readdir(vim.fn.stdpath("data") .. "/site/pack/deps/opt")
	end)
	if ok then
		plugin_count = #entries
	end

	local datetime = os.date("%Y-%m-%d %H:%M:%S")
	return string.format("  %d plugins loaded  •  %s", plugin_count, datetime)
end

-- LazyVim-style menu buttons
dashboard.section.buttons.val = {
	dashboard.button("f", " " .. "  Find file", ":Telescope find_files <CR>"),
	dashboard.button("n", " " .. "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("r", " " .. "  Recent files", ":Telescope oldfiles <CR>"),
	dashboard.button("g", " " .. "  Find text", ":Telescope live_grep <CR>"),
	dashboard.button("c", " " .. "  Config", ":e $MYVIMRC <CR>"),
	dashboard.button("s", " " .. "  Restore session", ':lua require("persistence").load() <CR>'),
	dashboard.button("l", " " .. "  MiniDeps / Plugins", ":lua MiniDeps.update() <CR>"),
	dashboard.button("q", " " .. "  Quit", ":qa <CR>"),
}

-- Set footer with plugin count and datetime
dashboard.section.footer.val = footer()

-- Highlight groups (match colorscheme like LazyVim does)
dashboard.section.header.opts.hl = "AlphaHeader"
dashboard.section.buttons.opts.hl = "AlphaButtons"
dashboard.section.footer.opts.hl = "AlphaFooter"

-- Layout: spacing similar to LazyVim's dashboard
dashboard.config.layout = {
	{ type = "padding", val = 2 },
	dashboard.section.header,
	{ type = "padding", val = 2 },
	dashboard.section.buttons,
	{ type = "padding", val = 1 },
	dashboard.section.footer,
}

alpha.setup(dashboard.config)

-- Disable folding and statusline/tabline on the alpha buffer (LazyVim behavior)
vim.api.nvim_create_autocmd("User", {
	pattern = "AlphaReady",
	callback = function()
		vim.opt_local.foldenable = false
		vim.opt.laststatus = 0 -- hide statusline while on dashboard
	end,
})

-- Restore statusline when leaving the alpha buffer
vim.api.nvim_create_autocmd("BufUnload", {
	buffer = 0,
	callback = function()
		vim.opt.laststatus = 3
	end,
})
