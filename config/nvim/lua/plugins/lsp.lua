return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",

		-- Autocompletion
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		"L3MON4D3/LuaSnip",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
		"onsails/lspkind.nvim",
		-- for notifications
		"j-hui/fidget.nvim",
		-- autopairs
		"windwp/nvim-autopairs",
	},
	config = function()
		local cmp = require("cmp")
		require("fidget").setup()
		require("mason").setup()
		local lspconfig = require("lspconfig")
		lspconfig.phpactor.setup({
			settings = {
				["phpactor"] = {
					on_attach = on_attach,
					capabilities = capabilities,
				},
			},
		})
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls", -- LUA
				"html", -- HTML
				"cssls", -- CSS
				"jedi_language_server", -- Python
				-- "phpactor", -- PHP
				"intelephense", -- PHP
			},

			-- Start LSP
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({
						-- capabilities = capabilities,
					})
				end,
				["phpactor"] = function()
					require("lspconfig").phpactor.setup({
						on_attach = on_attach,
						capabilities = capabilities,
						default_config = {
							cmd = { "phpactor", "language-server", "-vvv" },
							filetypes = { "php" },
							root_dir = function()
								return vim.fn.expand("%:p:h")
							end,
						},
					})
				end,

				["lua_ls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								runtime = { version = "Lua 5.1" },
								diagnostics = {
									globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
								},
							},
						},
					})
				end,
			},
		})
		-- Snippets
		local ls = require("luasnip")
		require("luasnip.loaders.from_vscode").lazy_load()
		-- vim.keymap.set({ "i" }, "<C-K>", function()
		-- 	ls.expand()
		-- end, { silent = true })
		-- vim.keymap.set({ "i", "s" }, "<Tab>", function() ls.jump(1) end, { silent = true })
		-- vim.keymap.set({ "i", "s" }, "<S-Tab>", function() ls.jump(-1) end, { silent = true })
		--
		-- vim.keymap.set({ "i", "s" }, "<C-E>", function()
		-- 	if ls.choice_active() then
		-- 		ls.change_choice(1)
		-- 	end
		-- end, { silent = true })

		-- CMP
		local cmp_select = { behavior = cmp.SelectBehavior.Select }
		cmp.setup({
			snippet = {
				expand = function(args)
					ls.lsp_expand(args.body)
				end,
			},
			window = {
				-- completion = cmp.config.window.bordered(),
				-- documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				-- Cycle through completion results with ctrl + k/j
				["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
				["<C-up>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-down>"] = cmp.mapping.select_next_item(cmp_select),
				-- ["<S-Tab>"] = cmp.mapping.select_prev_item(cmp_select),
				-- ["<Tab>"] = cmp.mapping.select_next_item(cmp_select),
				-- Cycle through docs with ctrl + b/f (back / forward)
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				-- Brings up the completion menu when in insert mode
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),

				-- Accept completion with <CR> (return / enter)
				-- Accept currently selected item. If none selected, `select` first item.
				-- Set `select` to `false` to only confirm explicitly selected items.
				["<CR>"] = cmp.mapping.confirm({ select = false }),
				--
				-- ["<CR>"] = cmp.mapping(function(fallback)
				-- 	if cmp.visible() then
				-- 		if ls.expandable() then
				-- 			ls.expand()
				-- 		else
				-- 			cmp.confirm({
				-- 				select = true,
				-- 			})
				-- 		end
				-- 	else
				-- 		fallback()
				-- 	end
				-- end),

				["<Tab>"] = cmp.mapping(function(fallback)
					if ls.locally_jumpable(1) then
						ls.jump(1)
					else
						fallback()
					end
				end, { "i", "s" }),

				["<S-Tab>"] = cmp.mapping(function(fallback)
					if ls.locally_jumpable(-1) then
						ls.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" }, -- For luasnip users.
			}, {
				{ name = "buffer" },
				{ name = "path" },
				{ name = "cmdline" },
			}),
			-- formatting = {
			-- 	fields = { "kind", "abbr", "menu" },
			-- },
			formatting = {
				format = require("lspkind").cmp_format({
					with_text = true,
					menu = {
						buffer = "[Buffer]",
						nvim_lsp = "[LSP]",
						luasnip = "[LuaSnip]",
						nvim_lua = "[Lua]",
						latex_symbols = "[Latex]",
					},
				}),
			},
		})

		-- Diagnostics
		-- Inline virtural diagnostics text
		vim.diagnostic.config({
			virtual_text = true,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})
		-- hover over line for diagnostics
		-- vim.api.nvim_create_autocmd("CursorHold", {
		-- 	buffer = bufnr,
		-- 	callback = function()
		-- 		local opts = {
		-- 			focusable = false,
		-- 			close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
		-- 			border = "rounded",
		-- 			source = "always",
		-- 			prefix = " ",
		-- 			scope = "line",
		-- 		}
		-- 		vim.diagnostic.open_float(nil, opts)
		-- 	end,
		-- })

		-- Auto Pairs
		local npairs = require("nvim-autopairs")
		npairs.setup({
			fast_wrap = {},
		})
		-- CMP integration
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		local cmp_status_ok, cmp = pcall(require, "cmp")
		if not cmp_status_ok then
			return
		end
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
	end,
}
