local m = {
	"numtostr/comment.nvim",
	cond = not vim.g.vscode,
}

m.config = function()
	require("Comment").setup()
end

return m
