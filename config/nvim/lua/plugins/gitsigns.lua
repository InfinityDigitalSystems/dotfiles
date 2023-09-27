local m = {
	"lewis6991/gitsigns.nvim",
	cond = not vim.g.vscode,
}

m.config = function()
	require("gitsigns").setup()
end

return m
