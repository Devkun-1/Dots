local MiniDeps = require("mini.deps")

MiniDeps.add({
source = "nvim-treesitter/nvim-treesitter",
checkout = "master",

hooks = {
post_install = function() vim.cmd("TSUpdate") end,
post_checkout = function() vim.cmd("TSUpdate") end,
},
})

local treesitter = require("nvim-treesitter")
local ensure_installed = {
"json", "javascript", "typescript", "tsx", "go", "yaml", "html", "css",
"python", "http", "prisma", "svelte", "graphql", "bash", "vim",
"dockerfile", "gitignore", "query", "vimdoc", "c", "java", "rust", "ron",
}
treesitter.install(ensure_installed)


vim.api.nvim_create_autocmd("FileType", {
pattern = "*",
callback = function(args)
local buf = args.buf
local ft = vim.bo[buf].filetype
local lang = vim.treesitter.language.get_lang(ft)
if not lang then return end

pcall(vim.treesitter.start, buf, lang)

if ft ~= "yaml" and ft ~= "markdown" then
vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
vim.bo[buf].smartindent = false
vim.bo[buf].cindent = false
end
end,
})

