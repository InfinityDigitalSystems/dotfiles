local m = { "akinsho/bufferline.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } }

m.init = function()
  require("bufferline").setup({
    options = {
      -- offsets = { { filetype = "NvimTree", text = "Explorer", padding = 1, text_align = "left" } },
      always_show_bufferline = false,
      numbers = "ordinal",
      themable = true,
    }
  })
end

return m
