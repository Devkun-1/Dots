-- ~/.config/nvim/lua/plugins/lualine.lua

local add = MiniDeps.add

-- Add lualine.nvim and its icon dependency
add({
	source = "nvim-lualine/lualine.nvim",
	depends = { "nvim-tree/nvim-web-devicons" },
})

-- Helper: get diagnostic icons (matches LazyVim's default icons)
local icons = {
	diagnostics = {
		Error = "",
		Warn = "",
		Hint = "",
		Info = "󱆾",
	},
	git = {
		added = " ",
		modified = " ",
		removed = " ",
	},
}

-- Component: show LSP status (LazyVim shows attached LSP clients)
local function lsp_clients()
	local buf_clients = vim.lsp.get_clients({ bufnr = 0 })
	if #buf_clients == 0 then
		return ""
	end

	local names = {}
	for _, client in ipairs(buf_clients) do
		table.insert(names, client.name)
	end

	return " " .. table.concat(names, ", ")
end

require("lualine").setup({
	options = {
		theme = "auto", -- automatically match the current colorscheme
		globalstatus = true, -- single statusline for all windows (LazyVim default)
		disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
		component_separators = "",
		section_separators = { left = "", right = "" },
	},

	sections = {
		lualine_a = { "mode" },

		lualine_b = { "branch" },

		lualine_c = {
			{
				"diagnostics",
				symbols = {
					error = icons.diagnostics.Error,
					warn = icons.diagnostics.Warn,
					info = icons.diagnostics.Info,
					hint = icons.diagnostics.Hint,
				},
			},
			{
				"filetype",
				icon_only = true,
				separator = "",
				padding = { left = 1, right = 0 },
			},
			{ "filename", path = 0, symbols = { modified = "  ", readonly = "", unnamed = "" } },
		},

		lualine_x = {
			-- Show attached LSP clients (similar to LazyVim's cmp_lsp component)
			{ lsp_clients, icon = " " },
			{
				"diff",
				symbols = {
					added = icons.git.added,
					modified = icons.git.modified,
					removed = icons.git.removed,
				},
			},
		},

		lualine_y = {
			{ "progress", separator = " ", padding = { left = 1, right = 0 } },
			{ "location", padding = { left = 0, right = 1 } },
		},

		lualine_z = {
			function()
				return " " .. os.date("%R") -- show current time (LazyVim-style clock)
			end,
		},
	},

	extensions = { "neo-tree", "lazy" },
})
