vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function()
		-- Formats the buffer synchronously before writing to disk
		vim.lsp.buf.format({ async = false })
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function(args)
		local buf = args.buf
		local ft = vim.bo[buf].filetype
		local lang = vim.treesitter.language.get_lang(ft)
		if not lang then
			return
		end

		pcall(vim.treesitter.start, buf, lang)

		if ft ~= "yaml" and ft ~= "markdown" then
			vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			vim.bo[buf].smartindent = false
			vim.bo[buf].cindent = false
		end
	end,
})


