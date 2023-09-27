local m = {
	"mbbill/undotree",
	cond = not vim.g.vscode,
}

m.config = function()
	vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { noremap = true, silent = true, desc = "UNDO Tree" })
end

return m
