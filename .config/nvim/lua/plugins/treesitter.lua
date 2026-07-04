local MiniDeps = require("mini.deps")
local add, now = MiniDeps.add, MiniDeps.now

now(function()
  add({
    source = "nvim-treesitter/nvim-treesitter",
    checkout = "master",
    hooks = {
      post_install = function()
        vim.cmd("TSUpdate")
      end,
      post_checkout = function()
        vim.cmd("TSUpdate")
      end,
    },
  })
end)

now(function()
  add({
    source = "windwp/nvim-ts-autotag",
  })
end)

local configs = require("nvim-treesitter")
configs.setup({
  ensure_installed = {
    "json",
    "javascript",
    "typescript",
    "tsx",
    "go",
    "yaml",
    "html",
    "css",
    "python",
    "http",
    "prisma",
    "svelte",
    "graphql",
    "bash",
    "vim",
    "dockerfile",
    "gitignore",
    "query",
    "vimdoc",
    "c",
    "java",
    "rust",
    "ron",
  },
  auto_install = true,
  highlight = {
    enable = true,
  },
})

require("nvim-ts-autotag").setup({
  opts = {
    enable_close = true,
    enable_rename = true,
    enable_close_on_slash = true,
  },
  per_filetype = {
    ["html"] = {
      enable_close = true,
      enable_rename = true,
      enable_close_on_slash = true,
    },
  },
})
