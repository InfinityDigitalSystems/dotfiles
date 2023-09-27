local m = {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cond = not vim.g.vscode,
}

m.config = function()
  require("bufferline").setup({
    options = {
      -- offsets = { { filetype = "NvimTree", text = "Explorer", padding = 1, text_align = "left" } },
      always_show_bufferline = false,
      numbers = "ordinal",
      -- themable = true,
    },
  })
end

return m
