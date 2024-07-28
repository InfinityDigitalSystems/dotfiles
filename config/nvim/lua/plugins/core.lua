local m = {
	{
		"nvchad/nvim-colorizer.lua",
		cond = not vim.g.vscode,
	},
	{
		"lewis6991/impatient.nvim",
		cond = not vim.g.vscode,
	},
	{
		"numtostr/comment.nvim",
		cond = not vim.g.vscode,
	},
	{
		"folke/which-key.nvim",
		cond = not vim.g.vscode,
	},
	{
		"mbbill/undotree",
		cond = not vim.g.vscode,
	},
	{
		"lewis6991/gitsigns.nvim",
		cond = not vim.g.vscode,
	},
	{
		"andrewferrier/wrapping.nvim",
		cond = not vim.g.vscode,
	},
	{
		"famiu/bufdelete.nvim",
		cond = not vim.g.vscode,
	},
	{
		"jghauser/follow-md-links.nvim",
	},
	{
		"lambdalisue/suda.vim",
		cond = not vim.g.vscode,
	},
	{
		"iamcco/markdown-preview.nvim",
		ft = "markdown",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
		cond = not vim.g.vscode,
	},
}

m[1].config = function()
	require("colorizer").setup()
end

m[2].init = function()
	require("impatient").enable_profile()
end

m[3].config = function()
	require("Comment").setup()
	local ft = require("Comment.ft")
	ft.php = { "//%s", "/*%s*/" }
end

m[4].config = function()
	vim.o.timeout = true
	vim.o.timeoutlen = 50
	local which_key = require("which-key")
	which_key.setup({
		layout = {
			width = { min = 10 }, -- min and max width of the columns
			spacing = 9, -- spacing between columns
			align = "centre",
		},
		preset = "modern",
	})

	local group_names = require("keymaps").group_names
	-- table.insert(group_names, { g = { name = "g Prefix" }, z = { name = "z Prefix" } })
	table.insert(group_names, { { "g", group = "g Prefix" }, { "z", group = "z Prefix" } })
	which_key.add(group_names)

	-- which_key.register(group_names, {
	-- 	mode = "n", -- NORMAL mode
	-- 	prefix = "<leader>",
	-- 	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	-- 	silent = true, -- use `silent` when creating keymaps
	-- 	noremap = true, -- use `noremap` when creating keymaps
	-- 	nowait = true, -- use `nowait` when creating keymaps
	-- })
end

m[5].config = function()
	vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { noremap = true, silent = true, desc = "UNDO Tree" })
end

m[6].config = function()
	require("gitsigns").setup()
end

m[7].config = function()
	require("wrapping").setup()
end

return m
