local m = {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v2.x",
	dependencies = {
		-- LSP Support
		{ "neovim/nvim-lspconfig" }, -- Required
		{ "williamboman/mason.nvim" }, -- Optional
		{ "williamboman/mason-lspconfig.nvim" }, -- Optional

		-- Autocompletion
		{ "hrsh7th/nvim-cmp" }, -- Required
		{ "hrsh7th/cmp-nvim-lsp" }, -- Required
		{ "L3MON4D3/LuaSnip" }, -- Required
		{ "hrsh7th/cmp-buffer" }, -- Optional
		{ "hrsh7th/cmp-path" }, -- Optional
		{ "saadparwaiz1/cmp_luasnip" }, -- Optional
		{ "rafamadriz/friendly-snippets" }, -- Optional
	},
	cond = not vim.g.vscode,
}

m.config = function()
	local lsp = require("lsp-zero")

	lsp.on_attach(function(client, bufnr)
		require("keymaps").lsp_keymaps(bufnr)
	end)
	lsp.preset("recommended")

	lsp.ensure_installed({
		"lua_ls",
		"emmet_language_server",
		"html",
		"cssls",
	})

	-- Fix Undefined global 'vim'
	lsp.nvim_workspace()
	require("luasnip.loaders.from_vscode").lazy_load()
	local cmp = require("cmp")
	local cmp_select = { behavior = cmp.SelectBehavior.Select }

	-- 	local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
	-- 	require("lspconfig").cssls.setup({
	-- 		capabilities = capabilities,
	-- 	})
	--
	-- local capabilities = vim.lsp.protocol.make_client_capabilities()
	-- capabilities.textDocument.completion.completionItem.snippetSupport = true
	--
	--Enable completion
	local lsp_config = require("lspconfig")
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true

	local general_on_attach = function(client, bufnr)
		if client.resolved_capabilities.completion then
			cmp.on_attach(client, bufnr)
		end
	end

	-- Setup basic lsp servers
	for _, server in pairs({ "html", "cssls" }) do
		lsp_config[server].setup({
			-- Add capabilities
			capabilities = capabilities,
			on_attach = general_on_attach,
		})
	end

	local cmp_mappings = lsp.defaults.cmp_mappings({
		-- Cycle through completion results with ctrl + k/j
		["<A-k>"] = cmp.mapping.select_prev_item(cmp_select),
		["<A-j>"] = cmp.mapping.select_next_item(cmp_select),
		-- Cycle through docs with ctrl + b/f (back / forward)
		["<A-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
		["<A-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
		-- Brings up the completion menu when in insert mode
		["<A-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		-- Disables default ctrl + y mapping (I believe the default mapping is to accept a completion
		["<C-y>"] = cmp.config.disable,
		-- closes the completion menu
		["<A-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),

		-- Accept completion with <CR> (return / enter)
		-- Accept currently selected item. If none selected, `select` first item.
		-- Set `select` to `false` to only confirm explicitly selected items.
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		-- Super Tab
		["<Tab>"] = lsp.cmp_action().luasnip_supertab(),
		["<S-Tab>"] = lsp.cmp_action().luasnip_shift_supertab(),
	})
	cmp.setup({
		mapping = cmp_mappings,
	})

	lsp.setup()

	vim.diagnostic.config({
		virtual_text = false,
	})
	vim.api.nvim_create_autocmd("CursorHold", {
		buffer = bufnr,
		callback = function()
			local opts = {
				focusable = false,
				close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
				border = "rounded",
				source = "always",
				prefix = " ",
				scope = "line",
			}
			vim.diagnostic.open_float(nil, opts)
		end,
	})
end

return m
