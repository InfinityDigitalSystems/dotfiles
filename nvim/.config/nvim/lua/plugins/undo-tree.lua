local m = {"mbbill/undotree"}

m.init = function ()
  vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle,  { noremap = true, silent = true, desc = "UNDO Tree" })
end

return m
