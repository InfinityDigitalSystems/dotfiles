local m = {
	"lukas-reineke/indent-blankline.nvim",
	cond = not vim.g.vscode,
}

m.config = function()
	require("indent_blankline").setup({
		show_current_context = true,
		show_current_context_start = true,
	})
end

return m
