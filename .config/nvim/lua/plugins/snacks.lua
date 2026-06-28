local add = MiniDeps.add

add({
	source = "folke/snacks.nvim",
})

require("snacks").setup{
	-- bigfile = { enabled = true },
	-- dashboard = { enabled = true },
	-- explorer = { enabled = true },
	indent = { enabled = true },
	-- input = { enabled = true },
	picker = { enabled = true },
	notifier = { enabled = true },
	quickfile = { enabled = true },
	scope = { enabled = true },
	scroll = { enabled = false },
	statuscolumn = { enabled = true },
	words = { enabled = true },
}
