return {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
    config = function() 
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
    end
}
