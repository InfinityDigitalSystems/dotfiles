local m = {
	"nvchad/nvim-colorizer.lua",
	cond = not vim.g.vscode,
}

m.config = function()
	require("colorizer").setup()
end

return m
