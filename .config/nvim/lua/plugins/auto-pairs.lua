local add = MiniDeps.add
add({
	source = 'windwp/nvim-autopairs'
})

require('nvim-autopairs').setup({
  enable_check_bracket_line = true
})

