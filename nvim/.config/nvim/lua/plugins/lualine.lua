local m = {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
local colors = {
  bg = "#202122",
  bg1 = "#191A1A",
  fg = "#ECF0F3",
  red = "#E84545",
  green = "#5B9E2E",
  yellow = "#FFDE0A",
  blue = "#2494BA",
  purple = "#C054BC",
  cyan = "#42D7D4",
  gray = "#3C3F41",
}
local onedark_lualine_theme = {
  inactive = {
    a = { fg = colors.gray, bg = colors.bg, gui = "bold" },
    b = { fg = colors.gray, bg = colors.bg },
    c = { fg = colors.gray, bg = colors.bg1 },
  },
  normal = {
    a = { fg = colors.bg, bg = colors.blue, gui = "bold" },
    b = { fg = colors.fg, bg = colors.gray },
    c = { fg = colors.fg, bg = colors.bg1 },
  },
  visual = { a = { fg = colors.bg, bg = colors.purple, gui = "bold" } },
  replace = { a = { fg = colors.bg, bg = colors.red, gui = "bold" } },
  insert = { a = { fg = colors.bg, bg = colors.green, gui = "bold" } },
  command = { a = { fg = colors.bg, bg = colors.yellow, gui = "bold" } },
  terminal = { a = { fg = colors.bg, bg = colors.cyan, gui = "bold" } },
}

m.init = function()
  require("lualine").setup({
    options = {
      icons_enabled = true,
      theme = onedark_lualine_theme,
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = { "NvimTree" },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = false,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = { "filename" },
      lualine_x = { "encoding", "fileformat", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {},
  })
end

return m
