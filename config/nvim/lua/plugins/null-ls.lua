local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local m = {
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "jay-babu/mason-null-ls.nvim",
  },
  cond = not vim.g.vscode,
}
m.config = function()
  local mason_null_ls = require("mason-null-ls")
  local null_ls = require("null-ls")
  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics
  local code_actions = null_ls.builtins.code_actions

  mason_null_ls.setup({
    ensure_installed = {
      "stylua",
      -- "mypy",
      "ruff",
      "black",
      "prettier",
    },
  })
  null_ls.setup({
    sources = {
      -- diagnostics.mypy,
      diagnostics.ruff,
      formatting.stylua,
      formatting.black,
      formatting.prettier,
    },
    --format on save
    on_attach = function(client, bufnr)
      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({
          group = augroup,
          buffer = bufnr,
        })
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ bufnr = bufnr })
          end,
        })
      end
    end,
  })
end
return m
