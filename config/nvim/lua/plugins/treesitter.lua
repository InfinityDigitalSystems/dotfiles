local m = {
	{ "nvim-treesitter/nvim-treesitter", cond = not vim.g.vscode },
	{ "hiphish/rainbow-delimiters.nvim", cond = not vim.g.vscode },
	{ "windwp/nvim-ts-autotag", cond = not vim.g.vscode },
}

-- LUA INDEX's from 1 instead of 0
m[1].build = function()
	require("nvim-treesitter.install").update({ with_sync = true })
end

m[1].init = function()
	require("nvim-treesitter.configs").setup({
		ensure_installed = {
			"python",
			"lua",
			"c",
			"vim",
			"vimdoc",
			"query",
			"git_config",
			"git_rebase",
			"gitattributes",
			"gitcommit",
			"gitignore",
			"html",
			"css",
			"make",
			"markdown",
			"markdown_inline",
			"php",
		},
		sync_install = true,
		auto_install = true,
		ignore_install = { "" }, -- List of parsers to ignore installing
		highlight = {
			enable = true, -- false will disable the whole extension
			disable = { "" }, -- list of language that will be disabled
			additional_vim_regex_highlighting = true,
		},
		autopairs = { enable = true },
		indent = { enable = false, disable = { "yaml" } },
		context_commentstring = {
			enable = true,
			enable_autocmd = false,
		},
	})
end

m[2].config = function()
	-- This module contains a number of default definitions
	local rainbow_delimiters = require("rainbow-delimiters")

	---@type rainbow_delimiters.config
	vim.g.rainbow_delimiters = {
		strategy = {
			[""] = rainbow_delimiters.strategy["global"],
			vim = rainbow_delimiters.strategy["local"],
		},
		query = {
			[""] = "rainbow-delimiters",
			lua = "rainbow-blocks",
		},
		priority = {
			[""] = 110,
			lua = 210,
		},
		highlight = {
			"RainbowDelimiterRed",
			"RainbowDelimiterYellow",
			"RainbowDelimiterBlue",
			"RainbowDelimiterOrange",
			"RainbowDelimiterGreen",
			"RainbowDelimiterViolet",
			"RainbowDelimiterCyan",
		},
	}
end

m[3].config = function()
	require("nvim-ts-autotag").setup({
		opts = {
			-- Defaults
			enable_close = true, -- Auto close tags
			enable_rename = true, -- Auto rename pairs of tags
			enable_close_on_slash = false, -- Auto close on trailing </
		},
		-- Also override individual filetype configs, these take priority.
		-- Empty by default, useful if one of the "opts" global settings
		-- doesn't work well in a specific filetype
		per_filetype = {
			-- ["html"] = {
			-- 	enable_close = false,
			-- },
		},
	})
end

return m
