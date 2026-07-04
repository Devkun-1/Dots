local function add_theme(source, args)
	args = args or {}
	MiniDeps.add({
		source = source,
		config = function()
			local name = source:match("/_?([^.]+)"):gsub("%.nvim$", "")

			if args.opts then
				pcall(function()
					require(name).setup(args.opts)
				end)
			end

			if args.config then
				args.config()
			end
		end,
	})
end

-- tokyonight
add_theme("folke/tokyonight.nvim", {
	config = function()
		require("tokyonight").setup({
			transparent = true,
		})
	end,
})

-- kanagawa
add_theme("rebelot/kanagawa.nvim")

-- vscode
add_theme("Mofiqul/vscode.nvim")
