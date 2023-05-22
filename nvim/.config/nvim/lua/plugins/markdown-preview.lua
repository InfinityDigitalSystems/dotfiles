local m = {"iamcco/markdown-preview.nvim",ft = "markdown", build = function() vim.fn["mkdp#util#install"]() end}

return m
