return {
	"stevearc/conform.nvim",
	dependencies = {
		{ "zapling/mason-conform.nvim" },
		{ "williamboman/mason.nvim" },
	},

	config = function()
		local conform = require("conform")
		local mason_conform = require("mason-conform")
		conform.setup({
			formatters_by_ft = {
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
				php = { "pretty-php", "php_cs_fixer", "phpcs" },
				python = { "isort", "black", "ruff" },
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
				"ruff",
				"black",
				"prettier",
				"pretty-php",
				"php_cs_fixer",
				"phpcs",
			},
		})

		-- add the leader lf format key
		vim.keymap.set({ "n", "v" }, "<leader>lf", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Forna  file or range (in visual mode)" })
	end,
}
