local m = {
  "lmburns/lf.nvim",
  dependencies = {
    "plenary.nvim",
    "toggleterm.nvim",
  },
}

m.init = function ()
  local lf = require("lf")
  lf.setup ()

end

return m
