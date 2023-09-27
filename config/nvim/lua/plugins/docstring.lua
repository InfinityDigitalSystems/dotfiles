local m = {
	"danymat/neogen",
	dependencies = "nvim-treesitter/nvim-treesitter",
	config = true,
	version = "*",
	cond = not vim.g.vscode,
}

return m
