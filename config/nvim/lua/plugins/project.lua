local m = {
	"ahmedkhalf/project.nvim",
	cond = not vim.g.vscode,
}

m.config = function()
	require("telescope").load_extension("projects")
	require("project_nvim").setup({
		show_hidden = true,
		update_focused_file = {
			enable = true,
			update_root = true,
		},
	})
end
return m
