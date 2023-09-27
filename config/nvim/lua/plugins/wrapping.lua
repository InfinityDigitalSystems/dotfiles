local m = {
  "andrewferrier/wrapping.nvim",
  cond = not vim.g.vscode,
}

m.config = function()
  require("wrapping").setup()
end

return m
