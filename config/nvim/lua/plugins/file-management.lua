local function on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end
	vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
	vim.keymap.set("n", "e", api.node.open.edit, opts("Open"))
	vim.keymap.set("n", "o", api.node.open.edit, opts("Open"))
	vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
	vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
	vim.keymap.set("n", "h", api.tree.close, opts("Close"))
	vim.keymap.set("n", "a", api.fs.create, opts("Create"))
	vim.keymap.set("n", "d", api.fs.remove, opts("Delete"))
	vim.keymap.set("n", "x", api.fs.remove, opts("Delete"))
	vim.keymap.set("n", "D", api.fs.trash, opts("Trash"))
	vim.keymap.set("n", "E", api.tree.expand_all, opts("Expand All"))
	vim.keymap.set("n", "r", api.fs.rename_basename, opts("Rename: Basename"))
	vim.keymap.set("n", "R", api.tree.reload, opts("Refresh"))
end

local m = {
	{
		"lmburns/lf.nvim",
		dependencies = { "toggleterm.nvim" },
		cond = not vim.g.vscode,
	},
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"plenary.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		cond = not vim.g.vscode,
	},
	{
		"ahmedkhalf/project.nvim",
		cond = not vim.g.vscode,
	},
}

m[1].config = function()
	-- disable netrw at the very start of your init.lua (strongly advised)
	vim.g.loaded_netrw = 1
	vim.g.loaded_netrwPlugin = 1
	require("lf").setup({ escape_quit = true, border = "single", focus_on_open = true, winblend = 2 })
end

m[2].config = function()
	-- disable netrw at the very start of your init.lua (strongly advised)
	vim.g.loaded_netrw = 1
	vim.g.loaded_netrwPlugin = 1
	require("nvim-tree").setup({
		on_attach = on_attach,
		sort_by = "name",
		root_dirs = {},
		prefer_startup_root = false,
		sync_root_with_cwd = true,
		reload_on_bufenter = false,
		respect_buf_cwd = false,

		view = {
			width = 40,
			centralize_selection = true,
		},
		git = {
			enable = true,
			ignore = false,
			timeout = 400,
		},
		hijack_directories = {
			enable = false,
			auto_open = true,
		},
		update_focused_file = {
			enable = true,
			debounce_delay = 15,
			update_root = true,
			ignore_list = {},
		},
		renderer = {
			group_empty = true,
			root_folder_label = false,
			highlight_git = false,
			full_name = false,
			icons = {
				show = {
					file = true,
					folder = true,
					folder_arrow = true,
					git = true,
				},
				glyphs = {
					default = "",
					symlink = "",
					git = {
						unstaged = "",
						staged = "S",
						unmerged = "",
						renamed = "➜",
						deleted = "",
						untracked = "U",
						ignored = "◌",
					},
					folder = {
						default = "",
						open = "",
						empty = "",
						empty_open = "",
						symlink = "",
					},
				},
			},
		},
	})
end

m[3].config = function()
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
