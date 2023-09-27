local m = {
	"akinsho/toggleterm.nvim",
	cond = not vim.g.vscode,
}

m.config = function()
	require("toggleterm").setup({
		size = 10,
		open_mapping = [[<A-\>]],
		hide_numbers = true,
		shade_filetypes = {},
		shade_terminals = true,
		start_in_insert = true,
		insert_mappings = true,
		persist_size = true,
		direction = "horizontal", -- 'vertical' | 'horizontal' | 'tab' | 'float'
		close_on_exit = true,
		shell = vim.o.shell,
	})
	-- Setup LazyGit
	local Terminal = require("toggleterm.terminal").Terminal
	local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, close_on_exit = true, direction = "float" })

	function _LAZYGIT_TOGGLE_TERM()
		lazygit:toggle()
	end
end

return m
