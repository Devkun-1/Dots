local add = MiniDeps.add

add({ source = 'nvim-mini/mini.statusline', checkout = 'stable' })

require('mini.statusline').setup()
