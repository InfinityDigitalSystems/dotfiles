local colors = {
	bg = "#232326",
	bg1 = "#2c2d31",
	bg2 = "#35363b",
	bg3 = "#37383d",
	fg = "#a7aab0",
	red = "#de5d68",
	green = "#8fb573",
	yellow = "#dbb671",
	blue = "#57a5e5",
	purple = "#bb70d2",
	cyan = "#37A8B7",
	gray = "#5a5b5e",
}
local lualine_theme = {
	inactive = {
		a = { fg = colors.bg, bg = colors.purple },
		b = { fg = colors.fg, bg = colors.bg },
		c = { fg = colors.fg, bg = colors.bg },
		z = { fg = colors.fg, bg = colors.bg1 },
	},
	normal = {
		a = { fg = colors.bg, bg = colors.cyan, gui = "bold" },
		b = { fg = colors.fg, bg = colors.bg2, gui = "bold" },
		c = { fg = colors.fg, bg = colors.bg, gui = "bold" },
	},
	visual = { a = { fg = colors.bg, bg = colors.purple, gui = "bold" } },
	replace = { a = { fg = colors.bg, bg = colors.red, gui = "bold" } },
	insert = { a = { fg = colors.bg, bg = colors.green, gui = "bold" } },
	command = { a = { fg = colors.bg, bg = colors.yellow, gui = "bold" } },
	terminal = { a = { fg = colors.bg, bg = colors.cyan, gui = "bold" } },
}
local function spacer()
	return "◉"
end

local m = {
	{
		"navarasu/onedark.nvim",
		cond = not vim.g.vscode,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		cond = not vim.g.vscode,
	},
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		cond = not vim.g.vscode,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
	},
}

m[1].config = function()
	require("onedark").setup({
		-- Main options --
		style = "warmer", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
		transparent = false, -- Show/hide background
		term_colors = true, -- Change terminal color as per the selected theme style
		ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
		cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu
		-- toggle theme style ---
		toggle_style_key = nil, -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
		-- toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between
		-- Change code style ---
		-- Options are italic, bold, underline, none
		-- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
		code_style = {
			comments = "italic",
			keywords = "bold",
			functions = "bold",
			strings = "italic",
			variables = "none",
		},
		-- Lualine options --
		lualine = {
			transparent = false, -- lualine center bar transparency
		},
		highlights = {
			FoldColumn = { fg = colors.fg, bg = colors.bg },
		}, -- Override highlight groups
		-- Plugins Config --
		diagnostics = {
			darker = true, -- darker colors for diagnostic
			undercurl = true, -- use undercurl instead of underline for diagnostics
			background = true, -- use background color for virtual text
		},
	})
	require("onedark").load()
end

m[2].config = function()
	require("lualine").setup({
		options = {
			icons_enabled = true,
			theme = lualine_theme,
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = {
				winbar = { "alpha", "NvimTree", "toggleterm" },
				statusline = { "alpha" },
			},
			ignore_focus = {},
			always_divide_middle = true,
			globalstatus = true,
			refresh = {
				statusline = 1000,
				tabline = 1000,
				winbar = 1000,
			},
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		sections = {
			lualine_a = { "mode" },
			lualine_b = {
				{
					"buffers",
					show_filename_only = true, -- Shows shortened relative path when set to false.
					hide_filename_extension = false, -- Hide filename extension when set to true.
					show_modified_status = true, -- Shows indicator when the buffer is modified.
					mode = 0, -- 0: Shows buffer name
					-- 1: Shows buffer index
					-- 2: Shows buffer name + buffer index
					-- 3: Shows buffer number
					-- 4: Shows buffer name + buffer number
					max_length = vim.o.columns * 2 / 3, -- Maximum width of buffers component,
					-- it can also be a function that returns
					-- the value of `max_length` dynamically.
					filetype_names = {
						TelescopePrompt = "Telescope",
						dashboard = "Dashboard",
						packer = "Packer",
						fzf = "FZF",
						alpha = "Dashboard",
						NvimTree = "Explorer",
					}, -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )
					-- buffers_color = {
					--   -- Same values as the general color option can be used here.
					--   active = 'lualine_{normal}_normal', -- Color for active buffer.
					--   inactive = 'lualine_{insert}_inactive', -- Color for inactive buffer.
					-- },

					symbols = {
						modified = " ●", -- Text to show when the buffer is modified
						alternate_file = "", -- Text to show to identify the alternate file
						directory = "", -- Text to show when the buffer is a directory
					},
				},
			},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = { spacer },
		},
		winbar = {
			lualine_a = { spacer },
			lualine_b = { "branch", "diff", "diagnostics" },
			lualine_c = { { "filename", path = 1 } },
			lualine_x = { "encoding", "fileformat", "filetype" },
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
		inactive_winbar = {
			lualine_a = { spacer },
			lualine_b = { "branch", "diff", "diagnostics" },
			lualine_c = { { "filename", path = 1 } },
			lualine_x = { "encoding", "fileformat", "filetype" },
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
		extensions = {
			"fzf",
			"lazy",
			"mason",
			"lazy",
			"toggleterm",
		},
	})
end

m[3].config = function()
	require("which-key")
	local alpha = require("alpha")
	local dashboard = require("alpha.themes.dashboard")
	dashboard.section.header.val = {
		[[                                                    ]],
		[[                                                    ]],
		[[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
		[[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
		[[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
		[[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
		[[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
		[[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
		[[                                                    ]],
		[[                                                    ]],
	}
	dashboard.section.buttons.val = {
		dashboard.button("e", "    New file", ":ene <BAR> startinsert <CR>"),
		dashboard.button("spc  E", "󱏒    Open File Manager", "<cmd>lua require('lf').start()<cr>"),
		dashboard.button("spc ff", "    Find file", "<cmd>Telescope find_files hidden=true<CR>"),
		dashboard.button("spc fp", "    Find project", "<cmd>Telescope projects <CR>"),
		dashboard.button("spc fr", "󰁯    Recently used files", "<cmd>Telescope oldfiles <CR>"),
		dashboard.button("spc ft", "    Find text", "<cmd>Telescope live_grep <CR>"),
		dashboard.button("u", "    Update plugins", "<cmd>TSUpdate<CR><cmd>MasonUpdate<CR><CMD>Lazy update<CR>"),
		dashboard.button("q", "    Quit Neovim", "<cmd>qa<CR>"),
	}

	local function footer()
		return {
			[[   Brodie Henry 2024   ]],
		}
	end

	dashboard.section.footer.val = footer()
	for _, button in ipairs(dashboard.section.buttons.val) do
		-- button.opts.hl = "AlphaButtons"
		button.opts.hl_shortcut = "Function"
	end

	dashboard.section.footer.opts.hl = "Comment"
	dashboard.section.header.opts.hl = "Function"
	dashboard.section.buttons.opts.hl_shortcut = "Title"

	dashboard.opts.opts.noautocmd = true

	-- starts alpha
	alpha.setup(dashboard.opts)
end

return m
