local add = MiniDeps.add
add({
	 source = 'stevearc/oil.nvim',
	 depends = { 'nvim-mini/mini.icons' },
})

require("oil").setup({})
