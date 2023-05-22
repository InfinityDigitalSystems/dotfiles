local m = {"windwp/nvim-autopairs"}

m.config = function ()
    local npairs = require("nvim-autopairs")
    npairs.setup({
        fast_wrap = {},
    })
end

-- CMP integration
m.init = function ()
    local cmp_autopairs = require "nvim-autopairs.completion.cmp"
    local cmp_status_ok, cmp = pcall(require, "cmp")
    if not cmp_status_ok then
      return
    end
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
end

return m



