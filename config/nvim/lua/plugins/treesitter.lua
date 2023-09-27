local m = {
  { "nvim-treesitter/nvim-treesitter", cond = not vim.g.vscode },
  { "hiphish/nvim-ts-rainbow2",        cond = not vim.g.vscode },
  { "windwp/nvim-ts-autotag",          cond = not vim.g.vscode },
}

-- LUA INDEX's from 1 instead of 0
m[1].build = function()
  require("nvim-treesitter.install").update({ with_sync = true })
end

m[1].init = function()
  require("nvim-treesitter.configs").setup({
    ensure_installed = {
      "python",
      "lua",
      "c",
      "vim",
      "vimdoc",
      "query",
      "git_config",
      "git_rebase",
      "gitattributes",
      "gitcommit",
      "gitignore",
      "html",
      "css",
      "make",
      "markdown",
      "markdown_inline",
    },
    sync_install = true,
    auto_install = true,
    ignore_install = { "" }, -- List of parsers to ignore installing
    highlight = {
      enable = true,       -- false will disable the whole extension
      disable = { "" },    -- list of language that will be disabled
      additional_vim_regex_highlighting = true,
    },
    autopairs = { enable = true },
    autotag = {
      enable = true,
    },
    indent = { enable = false, disable = { "yaml" } },
    rainbow = {
      enable = true,
      -- list of languages you want to disable the plugin for
      disable = { "html" },
      -- Which query to use for finding delimiters
      query = "rainbow-parens",
      -- Highlight the entire buffer all at once
      strategy = require("ts-rainbow.strategy.global"),
    },
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
  })
end

return m
