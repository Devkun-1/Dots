local add = MiniDeps.add

add({
	source = "akinsho/bufferline.nvim",
	depends = {
		"nvim-tree/nvim-web-devicons",
	},
})

local bufferline = require("bufferline")

bufferline.setup({
	options = {
		mode = "buffers",
		style_preset = bufferline.style_preset.default,

		themable = true,
		numbers = "none",

		diagnostics = "nvim_lsp",

		separator_style = "thick",

		show_buffer_icons = true,
		show_buffer_close_icons = true,
		show_close_icon = true,
		show_tab_indicators = true,

		always_show_bufferline = true,

		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "left",
				separator = true,
			},
		},
	},
})
