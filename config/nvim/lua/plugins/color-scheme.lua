local m = {
  "navarasu/onedark.nvim",
  cond = not vim.g.vscode,
}
m.config = function()
  require("onedark").setup({
    -- Main options --
    style = "warmer",                                                                  -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
    transparent = false,                                                               -- Show/hide background
    term_colors = true,                                                                -- Change terminal color as per the selected theme style
    ending_tildes = false,                                                             -- Show the end-of-buffer tildes. By default they are hidden
    cmp_itemkind_reverse = false,                                                      -- reverse item kind highlights in cmp menu
    -- toggle theme style ---
    toggle_style_key = nil,                                                            -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
    toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between
    -- Change code style ---
    -- Options are italic, bold, underline, none
    -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
    code_style = {
      comments = "italic",
      keywords = "bold",
      functions = "bold",
      strings = "none",
      variables = "none",
    },
    -- Lualine options --
    lualine = {
      transparent = false, -- lualine center bar transparency
    },
    -- Custom Highlights --
    colors = {
      bg0 = "#191A1A", -- Text Editor background
      bg_d = "#191A1A",
      bg1 = "#222323", -- Text Highlight
      bg2 = "#202121", -- Bottom Status Bar
      bg3 = "#424548", -- Dividers
      fg = "#F1F1E4",
      grey = "#5E6368", -- Comments
      purple = "#C76BC4",
      green = "#7EC44F",
      orange = "#F1A727",
      blue = "#37AAD1",
      yellow = "#FFDE0A",
      cyan = "#42D7D4",
      red = "#F56666",
      dark_cyan = "#2DCDCD",
      dark_red = "#E84545",
      dark_yellow = "#FACC00",
      dark_purple = "#C054BC",
    },             -- Override default colors
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
