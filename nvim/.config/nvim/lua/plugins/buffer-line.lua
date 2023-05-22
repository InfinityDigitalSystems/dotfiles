local m = {"akinsho/bufferline.nvim",dependencies = {"nvim-tree/nvim-web-devicons"}}

m.init = function ()
    require("bufferline").setup({
        options = {
            offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
            always_show_bufferline = false
        }
    })
end

return m
