return {
  "folke/snacks.nvim",
  config = function()
    require("snacks").setup({
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
    })
  end,
}
