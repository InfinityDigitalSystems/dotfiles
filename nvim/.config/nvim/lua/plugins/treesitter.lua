local m = {{"nvim-treesitter/nvim-treesitter"},{"hiphish/nvim-ts-rainbow2"}}

-- LUA INDEX's from 1 instead of 0
m[1].build = function()
    require("nvim-treesitter.install").update({ with_sync = true })
end

m[1].init = function ()
    require("nvim-treesitter.configs").setup {
        ensure_installed = "python",
        sync_install = true,
        --auto_install = true,
        ignore_install = { "" }, -- List of parsers to ignore installing
        highlight = {
            enable = true, -- false will disable the whole extension
            disable = { "" }, -- list of language that will be disabled
            additional_vim_regex_highlighting = true,
        },
        autopairs = {enable = true},
        indent = { enable = false, disable = { "yaml" } },
        rainbow = {
            enable = true,
            -- list of languages you want to disable the plugin for
            disable = { },
            -- Which query to use for finding delimiters
            query = 'rainbow-parens',
            -- Highlight the entire buffer all at once
            strategy = require 'ts-rainbow.strategy.global',
        },
        context_commentstring = {
            enable = true,
            enable_autocmd = false,
        },
    }
end

return m
