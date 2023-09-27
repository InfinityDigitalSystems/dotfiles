local m = {
	"lmburns/lf.nvim",
	dependencies = { "toggleterm.nvim" },
	cond = not vim.g.vscode,
}

m.config = function()
	-- disable netrw at the very start of your init.lua (strongly advised)
	vim.g.loaded_netrw = 1
	vim.g.loaded_netrwPlugin = 1
	require("lf").setup({ escape_quit = true, border = "single", focus_on_open = true, winblend = 2 })
end

return m
