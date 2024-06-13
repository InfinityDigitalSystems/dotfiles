local m = {
	"stevearc/conform.nvim",
	dependencies = {
		{ "zapling/mason-conform.nvim" },
		{ "williamboman/mason.nvim" },
	},
}

m.config = function()
	local conform = require("conform")
	local mason_conform = require("mason-conform")
	conform.setup({
		formatters_by_ft = {
			-- Conform will run multiple formatters sequentially
			-- python = { "isort", "black" },
			-- Use a sub-list to run only the first available formatter
			-- javascript = { { "prettierd", "prettier" } },
			--
			javascript = { "prettier" },
			typescript = { "prettier" },
			javascriptreact = { "prettier" },
			typescriptreact = { "prettier" },
			svelte = { "prettier" },
			css = { "prettier" },
			html = { "prettier" },
			json = { "prettier" },
			yaml = { "prettier" },
			markdown = { "prettier" },
			graphql = { "prettier" },
			liquid = { "prettier" },
			lua = { "stylua" },
			python = { "isort", "black" },
		},
		format_on_save = {
			lsp_fallback = true,
			async = false,
			timeout_ms = 1000,
		},
	})

	-- Install formaters
	mason_conform.setup({
		ensure_installed = {
			"stylua",
			-- "mypy",
			"ruff",
			"black",
			"prettier",
		},
	})

	vim.keymap.set({ "n", "v" }, "<leader>lf", function()
		conform.format({
			lsp_fallback = true,
			async = false,
			timeout_ms = 1000,
		})
	end, { desc = "Format file or range (in visual mode)" })
end

m.event = { "BufReadPre", "BufNewFile" }

return m

-- local conform = require("conform")
--
-- conform.setup({
--   formatters_by_ft = {
--     javascript = { "prettier" },
--     typescript = { "prettier" },
--     javascriptreact = { "prettier" },
--     typescriptreact = { "prettier" },
--     svelte = { "prettier" },
--     css = { "prettier" },
--     html = { "prettier" },
--     json = { "prettier" },
--     yaml = { "prettier" },
--     markdown = { "prettier" },
--     graphql = { "prettier" },
--     liquid = { "prettier" },
--     lua = { "stylua" },
--     python = { "isort", "black" },
--   },
--   format_on_save = {
--     lsp_fallback = true,
--     async = false,
--     timeout_ms = 1000,
--   },
-- })
--
--
-- end, { desc = "Format file or range (in visual mode)" })
