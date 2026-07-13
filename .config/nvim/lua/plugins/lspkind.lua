return {
	{
		"onsails/lspkind.nvim",
		config = function()
			local icons = require("config.icons")
			require("lspkind").setup({
				preset = "default",
				mode = "symbol_text",
				maxwidth = 50,
				symbol_map = icons.lspkind,
			})
		end,
	},
}
