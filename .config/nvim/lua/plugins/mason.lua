local add = MiniDeps.add

add({ source = "williamboman/mason.nvim" })
require("mason").setup()

add({ source = "williamboman/mason-lspconfig.nvim" })
require("mason-lspconfig").setup({
  ensure_installed = { 
		"lua_ls",
		"vtsls",
		"ts_ls",
		"pyright",
		"clangd",
		"cssls",
		"html",
		"arduino_language_server",
		"bashls",
    "tailwindcss",
    "emmet_language_server",
    "emmet_ls",
	},
})

add({ source = "neovim/nvim-lspconfig" })
-- local lspconfig = require("lspconfig")
--
-- require("mason-lspconfig").setup_handlers({
--   function(server_name)
--     lspconfig[server_name].setup({})
--   end,
-- })

