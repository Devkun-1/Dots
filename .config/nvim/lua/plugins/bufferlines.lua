-- ~/.config/nvim/lua/plugins/bufferline.lua

local add = MiniDeps.add

-- Add bufferline.nvim via mini.deps
add({
	source = "akinsho/bufferline.nvim",
	depends = { "nvim-tree/nvim-web-devicons" }, -- for file icons
})

-- Function to sync bufferline background with the current colorscheme
local function sync_bufferline_bg()
	-- Get background color from the "Normal" highlight group of the active colorscheme
	local normal_hl = vim.api.nvim_get_hl(0, { name = "Normal" })
	local bg_color = normal_hl.bg

	if not bg_color then
		return -- Exit if no background color is found (e.g. transparent theme)
	end

	-- List of bufferline highlight groups that should match the colorscheme background
	local groups = {
		"BufferLineBackground",
		"BufferLineFill",
		"BufferLineTab",
		"BufferLineTabSelected",
		"BufferLineTabClose",
		"BufferLineBufferVisible",
		"BufferLineBufferSelected",
		"BufferLineSeparator",
		"BufferLineSeparatorSelected",
		"BufferLineSeparatorVisible",
		"BufferLineIndicatorSelected",
	}

	for _, group in ipairs(groups) do
		-- Only override the background, keep other attributes (fg, bold, etc.)
		local existing = vim.api.nvim_get_hl(0, { name = group })
		existing.bg = bg_color
		vim.api.nvim_set_hl(0, group, existing)
	end
end

-- Setup bufferline
require("bufferline").setup({
	options = {
		mode = "buffers",
		diagnostics = "nvim_lsp",
		separator_style = "thin",
		show_buffer_close_icons = true,
		show_close_icon = false,
		color_icons = true,
	},
})

-- Run once on startup
sync_bufferline_bg()

-- Re-sync every time the colorscheme changes
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = sync_bufferline_bg,
	desc = "Sync bufferline background with current colorscheme",
})
