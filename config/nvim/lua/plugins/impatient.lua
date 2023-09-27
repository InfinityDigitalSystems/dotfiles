local m = {
	"lewis6991/impatient.nvim",
	cond = not vim.g.vscode,
}

m.init = function()
	require("impatient").enable_profile()
end

return m
