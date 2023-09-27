local m = {
	-- "ekickx/clipboard-image.nvim",
	"niuiic/cp-image.nvim",
	dependencies = "niuiic/niuiic-core.nvim",
	cond = not vim.g.vscode,
}

return m
