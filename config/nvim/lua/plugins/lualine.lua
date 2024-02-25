local m = {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cond = not vim.g.vscode,
}
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
  cyan = "#51a8b3",
  gray = "#5a5b5e",
}
local lualine_theme = {
  inactive = {
    b = { fg = colors.fg, bg = colors.bg },
    c = { fg = colors.fg, bg = colors.bg },
    z = { fg = colors.fg, bg = colors.bg1 },
  },
  normal = {
    a = { fg = colors.bg, bg = colors.blue, gui = "bold" },
    b = { fg = colors.fg, bg = colors.bg1, gui = "bold"},
    c = { fg = colors.fg, bg = colors.bg,},
  },
  visual = { a = { fg = colors.bg, bg = colors.purple, gui = "bold" } },
  replace = { a = { fg = colors.bg, bg = colors.red, gui = "bold" } },
  insert = { a = { fg = colors.bg, bg = colors.green, gui = "bold" } },
  command = { a = { fg = colors.bg, bg = colors.yellow, gui = "bold" } },
  terminal = { a = { fg = colors.bg, bg = colors.cyan, gui = "bold" } },
}
local function spacer()
  return " "
end

m.config = function()
  require("lualine").setup({
    options = {
      icons_enabled = true,
      theme = lualine_theme,
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = { "alpha"},
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = false,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      },
    },
    inactive_winbar = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
    winbar = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {
      lualine_a = { "mode" },
      lualine_b = {
        {
          'buffers',
          show_filename_only = true,       -- Shows shortened relative path when set to false.
          hide_filename_extension = false, -- Hide filename extension when set to true.
          show_modified_status = true,     -- Shows indicator when the buffer is modified.
          mode = 0,                        -- 0: Shows buffer name
          -- 1: Shows buffer index
          -- 2: Shows buffer name + buffer index
          -- 3: Shows buffer number
          -- 4: Shows buffer name + buffer number
          max_length = vim.o.columns * 2 / 3, -- Maximum width of buffers component,
          -- it can also be a function that returns
          -- the value of `max_length` dynamically.
          filetype_names = {
            TelescopePrompt = 'Telescope',
            dashboard = 'Dashboard',
            packer = 'Packer',
            fzf = 'FZF',
            alpha = 'Dashboard',
            NvimTree = 'Explorer'

          }, -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )

          symbols = {
            modified = ' ●', -- Text to show when the buffer is modified 
            alternate_file = '', -- Text to show to identify the alternate file
            directory = '', -- Text to show when the buffer is a directory
          },
        }
      },
      lualine_c = {"spacer"},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
    sections = {
      lualine_a = {},
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = { { "filename", path = 1 } },
      lualine_x = { "encoding", "fileformat", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },

    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = { { "filename", path = 1 } },
      lualine_x = { "encoding", "fileformat", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
    extensions = {
      "fzf",
      "lazy",
      "nvim-tree",
      "mason",
      "toggleterm"
    },
  })
end

return m
