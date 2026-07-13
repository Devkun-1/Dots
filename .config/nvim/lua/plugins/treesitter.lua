return {
	{
		"nvim-treesitter/nvim-treesitter",
		main = "nvim-treesitter", -- Use the updated main branch API
		event = { "BufReadPost", "BufNewFile" },
		init = function()
			-- Create a unique group to prevent duplicate autocommands
			local ts_group = vim.api.nvim_create_augroup("TSAutoInstallHighlight", { clear = true })

			vim.api.nvim_create_autocmd("FileType", {
				group = ts_group,
				callback = function(args)
					local ts = require("nvim-treesitter")

					-- Map Neovim FileType to Treesitter language name
					local lang = vim.treesitter.language.get_lang(args.match) or args.match

					-- Check if the parser is supported but not yet installed
					if vim.list_contains(ts.get_available(), lang) then
						if not vim.list_contains(ts.get_installed(), lang) then
							-- Auto-install unknown languages asynchronously in the background
							ts.install(lang):await(function()
								vim.schedule(function()
									if vim.api.nvim_buf_is_valid(args.buf) then
										pcall(vim.treesitter.start, args.buf)
										vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
									end
								end)
							end)
						else
							-- If already installed, enable highlighting and indentation instantly
							pcall(vim.treesitter.start, args.buf)
							vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
						end
					end
				end,
			})
		end,
		config = function()
			local ts = require("nvim-treesitter")

			-- Only used to define custom installation directories if needed
			ts.setup({
				install_dir = vim.fn.stdpath("data") .. "/site",
			})

			-- List of core languages you want to ensure are installed
			local ensure_installed = {
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
				"lua",
			}

			-- Pre-install all selected core languages asynchronously (Non-blocking)
			for _, lang in ipairs(ensure_installed) do
				if not vim.list_contains(ts.get_installed(), lang) then
					ts.install(lang)
				end
			end
		end,
	},
}
