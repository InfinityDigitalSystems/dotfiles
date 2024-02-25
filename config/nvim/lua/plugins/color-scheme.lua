local m = {
  "navarasu/onedark.nvim",
  cond = not vim.g.vscode,
}
m.config = function()
  require("onedark").setup({
    -- Main options --
    style = "warmer",                                                                 -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
    transparent = false,                                                               -- Show/hide background
    term_colors = true,                                                                -- Change terminal color as per the selected theme style
    ending_tildes = false,                                                             -- Show the end-of-buffer tildes. By default they are hidden
    cmp_itemkind_reverse = false,                                                      -- reverse item kind highlights in cmp menu
    -- toggle theme style ---
    toggle_style_key = nil,                                                            -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
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
    highlights = {}, -- Override highlight groups
    -- Plugins Config --
    diagnostics = {
      darker = true,  -- darker colors for diagnostic
      undercurl = true, -- use undercurl instead of underline for diagnostics
      background = true, -- use background color for virtual text
    },
  })
  require("onedark").load()
end

return m
	--
	-- warmer = {
	-- 	black = "#101012",
	-- 	bg0 = "#232326",
	-- 	bg1 = "#2c2d31",
	-- 	bg2 = "#35363b",
	-- 	bg3 = "#37383d",
	-- 	bg_d = "#1b1c1e",
	-- 	bg_blue = "#68aee8",
	-- 	bg_yellow = "#e2c792",
	-- 	fg = "#a7aab0",
	-- 	purple = "#bb70d2",
	-- 	green = "#8fb573",
	-- 	orange = "#c49060",
	-- 	blue = "#57a5e5",
	-- 	yellow = "#dbb671",
	-- 	cyan = "#51a8b3",
	-- 	red = "#de5d68",
	-- 	grey = "#5a5b5e",
	-- 	light_grey = "#818387",
	-- 	dark_cyan = "#2b5d63",
	-- 	dark_red = "#833b3b",
	-- 	dark_yellow = "#7c5c20",
	-- 	dark_purple = "#79428a",
	-- 	diff_add = "#282b26",
	-- 	diff_delete = "#2a2626",
	-- 	diff_change = "#1a2a37",
	-- 	diff_text = "#2c485f",
	-- },
