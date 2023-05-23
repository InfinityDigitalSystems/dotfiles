local kind_icons = {
  Text = "󰉿",
	Method = "󰆧",
	Function = "󰊕",
	Constructor = "",
  Field = " ",
	Variable = "󰀫",
	Class = "󰠱",
	Interface = "",
	Module = "",
	Property = "󰜢",
	Unit = "󰑭",
	Value = "󰎠",
	Enum = "",
	Keyword = "󰌋",
  Snippet = "",
	Color = "󰏘",
	File = "󰈙",
  Reference = "",
	Folder = "󰉋",
	EnumMember = "",
	Constant = "󰏿",
  Struct = "",
	Event = "",
	Operator = "󰆕",
  TypeParameter = " ",
	Misc = " ",
}
-- find more here: https://www.nerdfonts.com/cheat-sheet

local check_backspace = function()
  local col = vim.fn.col(".") - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end


local m = {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v1.x",
  dependencies = {
    -- LSP Support
    { "neovim/nvim-lspconfig" },           -- Required
    { "williamboman/mason.nvim" },         -- Optional
    { "williamboman/mason-lspconfig.nvim" }, -- Optional
    -- Autocompletion
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },       -- Required
    { "hrsh7th/cmp-buffer" },         -- Optional
    { "hrsh7th/cmp-path" },           -- Optional
    { "saadparwaiz1/cmp_luasnip" },   -- Optional
    { "hrsh7th/cmp-nvim-lua" },       -- Optional
    -- Snippets
    { "L3MON4D3/LuaSnip" },           -- Required
    { "rafamadriz/friendly-snippets" }, -- Optional
  },
}

m.config = function()

  local lsp = require("lsp-zero").preset({
    name = "minimal",
    manage_nvim_cmp = true,
    suggest_lsp_servers = true,
  })
  lsp.set_preferences({
    sign_icons = {
      error = "",
      warn = "",
      hint = "",
      info = "",
    },
  })
  lsp.setup({})
  -- Setup keybinds
  lsp.on_attach(function(client, bufnr)
    require("keymaps").lsp_keymaps(bufnr)
  end)
  -- require("mason-lspconfig").setup({
  --   ensure_installed = {
  --   }
  -- })
  -- setup CMP
  local cmp = require("cmp")
  local luasnip = require("luasnip")

  cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    preselect = cmp.PreselectMode.None,
    completion = {
      completeopt = "menu,menuone,noinsert,noselect",
    },
    mapping = {
      -- Cycle through completion results with ctrl + k/j
      ["<C-k>"] = cmp.mapping.select_prev_item(),
      ["<C-j>"] = cmp.mapping.select_next_item(),
      -- Cycle through docs with ctrl + b/f (back / forward)
      ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
      ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
      -- Brings up the completion menu when in insert mode
      ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
      -- Disables default ctrl + y mapping (I believe the default mapping is to accept a completion
      ["<C-y>"] = cmp.config.disable,
      -- closes the completion menu
      ["<C-e>"] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      -- Accept completion with <CR> (return / enter)
      -- Accept currently selected item. If none selected, `select` first item.
      -- Set `select` to `false` to only confirm explicitly selected items.
      ["<CR>"] = cmp.mapping.confirm({ select = false }),
      -- Super Tab
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expandable() then
          luasnip.expand()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif check_backspace() then
          fallback()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
    },
    formatting = {
      fields = { "kind", "abbr", "menu" },
      format = function(entry, vim_item)
        -- Kind icons
        vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
        -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
        vim_item.menu = ({
          nvim_lsp = "[LSP]",
          nvim_lua = "[NVIM_LUA]",
          luasnip = "[Snippet]",
          buffer = "[Buffer]",
          path = "[Path]",
        })[entry.source.name]
        return vim_item
      end,
    },
    sources = {
      { name = "buffer" },
      { name = "nvim_lsp" },
      { name = "nvim_lua" },
      { name = "luasnip" },
      { name = "path" },
    },
    confirm_opts = { behavior = cmp.ConfirmBehavior.Replace, select = false },
    window = { documentation = cmp.config.window.bordered() },
    experimental = {
      ghost_text = false, -- Shows ghost of text when completing (uses comment highlighting colors)
      native_menu = false,
    },
  })
  -- enable vim virtual text (inline diagnostics)
  vim.diagnostic.config ({virtual_text = true})
end

return m
