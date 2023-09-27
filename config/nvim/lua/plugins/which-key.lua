local m = {
	"folke/which-key.nvim",
	cond = not vim.g.vscode,
}

m.config = function()
	vim.o.timeout = true
	vim.o.timeoutlen = 50
	local which_key = require("which-key")
	which_key.setup({
		plugins = {
			marks = true, -- shows a list of your marks on ' and `
			registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode

			-- the presets plugin, adds help for a bunch of default keybindings in Neovim
			-- No actual key bindings are created
			presets = {
				operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
				motions = true, -- adds help for motions
				text_objects = true, -- help for text objects triggered after entering an operator
				windows = true, -- default bindings on <c-w>
				nav = true, -- misc bindings to work with windows
				z = true, -- bindings for folds, spelling and others prefixed with z
				g = true, -- bindings for prefixed with g
			},
		},
		key_labels = {
			["<leader>"] = "SPC",
		},
		icons = {
			breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
			separator = "➜", -- symbol used between a key and it's label
			group = "+", -- symbol prepended to a group
		},
		popup_mappings = {
			scroll_down = "<a-b>", -- binding to scroll down inside the popup
			scroll_up = "<a-f>", -- binding to scroll up inside the popup
		},
		window = {
			border = "none", -- none, single, double, shadow, rounded
			position = "bottom", -- bottom, top
			margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
			padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
			winblend = 0,
		},
		layout = {
			height = { min = 2, max = 25 }, -- min and max height of the columns
			width = { min = 10, max = 50 }, -- min and max width of the columns
			spacing = 3, -- spacing between columns
			align = "center", -- align columns left, center or right
		},
		hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
		show_help = false, -- show help message on the command line when the popup is visible
		triggers = "auto", -- automatically setup triggers
	})

	local group_names = require("keymaps").group_names
	table.insert(group_names, { g = { name = "g Prefix" }, z = { name = "z Prefix" } })

	which_key.register(group_names, {
		mode = "n", -- NORMAL mode
		prefix = "<leader>",
		buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
		silent = true, -- use `silent` when creating keymaps
		noremap = true, -- use `noremap` when creating keymaps
		nowait = true, -- use `nowait` when creating keymaps
	})
end

return m
