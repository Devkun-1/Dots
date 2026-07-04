local add = MiniDeps.add
add({
	source = "nvim-mini/mini.pairs",
	checkou = "stable",
})

require("mini.pairs").setup()
