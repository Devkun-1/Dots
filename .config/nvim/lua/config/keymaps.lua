local keymap = vim.keymap.set

--- oil
keymap("n", "<leader>e", "<cmd>Oil<cr>")

-- telescope
keymap("n", "<leader>ff", "<cmd> Telescope  find_files <cr>")

-- split window 
keymap("n", "sv", "<cmd> vsplit <cr>")
keymap("n", "ss", "<cmd> split <cr>")

-- Navigate to previous/next buffer
keymap('n', '<S-h>', '<Cmd>BufferLineCyclePrev<CR>', { desc = 'Cycle to previous buffer' })
keymap('n', '<S-l>', '<Cmd>BufferLineCycleNext<CR>', { desc = 'Cycle to next buffer' })

-- neotree
keymap('n', '<leader>no', '<cmd> Neotree toggle right<cr>')

-- move window
keymap("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
keymap("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
keymap("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
keymap("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })


