--https://neovim.io/doc/user/api.html#nvim_set_keymap()
--
--https://neovim.io/doc/user/intro.html#keycodes

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

local opts = { noremap = true, silent = true }
-- Init table for which key group names (which key acesses this if loaded)
local group_names = {}

--Remap space as leader key
keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Remove the f1 mapping
keymap("n", "<F1>", "<Nop>", opts)
keymap("i", "<F1>", "<Nop>", opts)
keymap("v", "<F1>", "<Nop>", opts)
keymap("x", "<F1>", "<Nop>", opts)

-- add standard motion bindings to insert mode
keymap("i", "<C-BS>", "<C-W>", opts)
keymap("n", "<C-Backspace>", "daw", opts)

-- Resize windows using alt + shift + [hjkl]
keymap("n", "<CS-up>", ":resize +2<CR>", opts)
keymap("n", "<CS-down>", ":resize -2<CR>", opts)
keymap("n", "<CS-left>", ":vertical resize -2<CR>", opts)
keymap("n", "<CS-right>", ":vertical resize +2<CR>", opts)
keymap("n", "<CS-k>", ":resize +2<CR>", opts)
keymap("n", "<CS-j>", ":resize -2<CR>", opts)
keymap("n", "<CS-h>", ":vertical resize -2<CR>", opts)
keymap("n", "<CS-l>", ":vertical resize +2<CR>", opts)

-- Shift focus between windows using alt + [hjkl]
keymap("n", "<C-left>", "<C-w>h", opts)
keymap("n", "<C-down>", "<C-w>j", opts)
keymap("n", "<C-up>", "<C-w>k", opts)
keymap("n", "<C-right>", "<C-w>l", opts)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Move Blocks around --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("v", "<C-,>", "<gv", opts)
keymap("v", "<C-.>", ">gv", opts)
keymap("v", "<C-left>", "<gv", opts)
keymap("v", "<C-right>", ">gv", opts)
keymap("v", "<C-h>", "<gv", opts)
keymap("v", "<C-l>", ">gv", opts)
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<C-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<C-k>", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<C-down>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<C-up>", ":move '<-2<CR>gv-gv", opts)

-- Splits
table.insert(group_names, { "<leader>s", group = "Splits" })
keymap("n", "<leader>sv", ":vsplit<CR>", vim.tbl_extend("force", opts, { desc = "Vertical Split" }))
keymap("n", "<leader>sh", ":split<CR>", vim.tbl_extend("force", opts, { desc = "Horizontal Split" }))
keymap("n", "<leader>sk", "<C-w>c", vim.tbl_extend("force", opts, { desc = "Window Kill" }))

-- Buffers
-- Cylce through Buffers
table.insert(group_names, { "<leader>b", group = "Buffers" })
-- table.insert(group_names, { b = { name = "Buffers" } })
keymap("n", "<C-o>", ":bprevious<CR>", vim.tbl_extend("force", opts, { desc = "Previous Buffer" }))
keymap("n", "<leader>bp", ":bprevious<CR>", vim.tbl_extend("force", opts, { desc = "Previous Buffer" }))
keymap("n", "<C-p>", ":bnext<CR>", vim.tbl_extend("force", opts, { desc = "Next Buffer" }))
keymap("n", "<leader>bn", ":bnext<CR>", vim.tbl_extend("force", opts, { desc = "Next Buffer" }))
keymap("n", "<CS-TAB>", ":bprevious<CR>", vim.tbl_extend("force", opts, { desc = "Previous Buffer" }))
keymap("n", "<C-TAB>", ":bnext<CR>", vim.tbl_extend("force", opts, { desc = "Next Buffer" }))
keymap("n", "<C-PageUp>", ":bprevious<CR>", vim.tbl_extend("force", opts, { desc = "Previous Buffer" }))
keymap("n", "<C-PageDown>", ":bnext<CR>", vim.tbl_extend("force", opts, { desc = "Next Buffer" }))
-- Close buffer
keymap("n", "<leader>bk", ":Bdelete<CR>", vim.tbl_extend("force", opts, { desc = "Kill Buffer" }))
keymap("n", "<C-w>", ":Bdelete<CR>", vim.tbl_extend("force", opts, { desc = "Kill Buffer" }))
-- Switch between buffers
keymap("n", "<leader>bs", "<cmd>Telescope buffers<cr>", vim.tbl_extend("force", opts, { desc = "Search Buffers" }))
keymap("n", "<C-TAB>", "<cmd>Telescope buffers<cr>", vim.tbl_extend("force", opts, { desc = "Search Buffers" }))
keymap(
	"n",
	"<leader>b1",
	"<cmd>:BufferLineGoToBuffer 1<cr>",
	vim.tbl_extend("force", opts, { desc = "Navigate to file 1" })
)
keymap("n", "<C-1>", "<cmd>:BufferLineGoToBuffer 1<cr>", vim.tbl_extend("force", opts, { desc = "Navigate to file 1" }))
keymap(
	"n",
	"<leader>b2",
	"<cmd>:BufferLineGoToBuffer 2<cr>",
	vim.tbl_extend("force", opts, { desc = "Navigate to file 2" })
)
keymap("n", "<C-2>", "<cmd>:BufferLineGoToBuffer 2<cr>", vim.tbl_extend("force", opts, { desc = "Navigate to file 2" }))
keymap(
	"n",
	"<leader>b3",
	"<cmd>:BufferLineGoToBuffer 3<cr>",
	vim.tbl_extend("force", opts, { desc = "Navigate to file 3" })
)
keymap("n", "<C-3>", "<cmd>:BufferLineGoToBuffer 3<cr>", vim.tbl_extend("force", opts, { desc = "Navigate to file 3" }))
keymap(
	"n",
	"<leader>b4",
	"<cmd>:BufferLineGoToBuffer 4<cr>",
	vim.tbl_extend("force", opts, { desc = "Navigate to file 4" })
)
keymap("n", "<C-4>", "<cmd>:BufferLineGoToBuffer 4<cr>", vim.tbl_extend("force", opts, { desc = "Navigate to file 4" }))
keymap(
	"n",
	"<leader>b5",
	"<cmd>:BufferLineGoToBuffer 5<cr>",
	vim.tbl_extend("force", opts, { desc = "Navigate to file 5" })
)
keymap("n", "<C-5>", "<cmd>:BufferLineGoToBuffer 5<cr>", vim.tbl_extend("force", opts, { desc = "Navigate to file 5" }))
keymap(
	"n",
	"<leader>b6",
	"<cmd>:BufferLineGoToBuffer 6<cr>",
	vim.tbl_extend("force", opts, { desc = "Navigate to file 6" })
)
keymap("n", "<C-6>", "<cmd>:BufferLineGoToBuffer 6<cr>", vim.tbl_extend("force", opts, { desc = "Navigate to file 6" }))
keymap(
	"n",
	"<leader>b7",
	"<cmd>:BufferLineGoToBuffer 7<cr>",
	vim.tbl_extend("force", opts, { desc = "Navigate to file 7" })
)
keymap("n", "<C-7>", "<cmd>:BufferLineGoToBuffer 7<cr>", vim.tbl_extend("force", opts, { desc = "Navigate to file 7" }))
keymap(
	"n",
	"<leader>b8",
	"<cmd>:BufferLineGoToBuffer 8<cr>",
	vim.tbl_extend("force", opts, { desc = "Navigate to file 8" })
)
keymap("n", "<C-8>", "<cmd>:BufferLineGoToBuffer 8<cr>", vim.tbl_extend("force", opts, { desc = "Navigate to file 8" }))
keymap(
	"n",
	"<leader>b9",
	"<cmd>:BufferLineGoToBuffer 9<cr>",
	vim.tbl_extend("force", opts, { desc = "Navigate to file 9" })
)
keymap("n", "<C-9>", "<cmd>:BufferLineGoToBuffer 9<cr>", vim.tbl_extend("force", opts, { desc = "Navigate to file 9" }))

-- Opens tree explorer
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
keymap(
	"n",
	"<leader>E",
	"<cmd>lua require('lf').start()<cr>",
	vim.tbl_extend("force", opts, { desc = "Open File Manager" })
)

--excute
-- table.insert(group_names, { x = { name = "Execute software" } })
table.insert(group_names, { "<leader>x", group = "Execute Software" })
keymap(
	"n",
	"<leader>xe",
	"<cmd>lua require('lf').start()<cr>",
	vim.tbl_extend("force", opts, { desc = "Open File Manager" })
)
keymap("n", "<leader>xg", "<cmd>lua _LAZYGIT_TOGGLE_TERM()<CR>", vim.tbl_extend("force", opts, { desc = "LazyGit" }))

-- Run Code
table.insert(group_names, { "<leader>r", group = "Run Code" })
-- table.insert(group_names, { r = { name = "Run Code" } })
keymap("n", "<leader>rp", ":w<CR>:TermExec cmd='python %'<CR>", vim.tbl_extend("force", opts, { desc = "Run Python" }))
keymap("n", "<leader>rl", ":w<CR>:TermExec cmd='lua %'<CR>", vim.tbl_extend("force", opts, { desc = "Run Lua" }))
keymap("n", "<leader>rm", ":MarkdownPreview<CR>", vim.tbl_extend("force", opts, { desc = "Markdown Preview" }))

-- Quit
table.insert(group_names, { "<leader>q", group = "Quit" })
-- table.insert(group_names, { q = { name = "Quit" } })
keymap("n", "<leader>qS", ":SudaWrite<CR>:xa<CR>:qa<CR>", vim.tbl_extend("force", opts, { desc = "Save as Sudo" }))
keymap("n", "<leader>qq", ":xa<CR>:qa<CR>", vim.tbl_extend("force", opts, { desc = "Save Quit All" }))
keymap("n", "<leader>qQ", ":qa!<CR>", vim.tbl_extend("force", opts, { desc = "Quit without saving" }))
keymap("n", "<leader>Q", ":qa!<CR>", vim.tbl_extend("force", opts, { desc = "Quit without saving" }))
-- Save
table.insert(group_names, { "<leader>w", group = "Save" })
-- table.insert(group_names, { w = { name = "Save" } })
keymap("n", "<leader>wa", ":wa<CR>", vim.tbl_extend("force", opts, { desc = "Save all" }))
keymap("n", "<leader>ww", ":w<CR>", vim.tbl_extend("force", opts, { desc = "Save" }))
keymap("n", "<leader>wS", ":SudaWrite<CR>", vim.tbl_extend("force", opts, { desc = "Save as Sudo" }))

-- Find
table.insert(group_names, { "<leader>f", group = "Find" })
-- table.insert(group_names, { f = { name = "Find" } })
keymap(
	"n",
	"<leader>ff",
	"<cmd>Telescope find_files hidden=true<cr>",
	vim.tbl_extend("force", opts, { desc = "Find File" })
)
keymap("n", "<leader>ft", "<cmd>Telescope live_grep<cr>", vim.tbl_extend("force", opts, { desc = "Live Grep" }))
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", vim.tbl_extend("force", opts, { desc = "Find Help" }))
keymap("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", vim.tbl_extend("force", opts, { desc = "Open Recent" }))
keymap("n", "<leader>fp", "<cmd>Telescope projects<cr>", vim.tbl_extend("force", opts, { desc = "Find Project" }))
keymap(
	"n",
	"<leader>f/",
	"<cmd>Telescope current_buffer_fuzzy_find<cr>",
	vim.tbl_extend("force", opts, { desc = "Find in current Buffer" })
)

-- LSP
table.insert(group_names, { "<leader>l", group = "LSP" })
-- table.insert(group_names, { l = { name = "LSP" } })
-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local bo = { buffer = ev.buf, noremap = true, silent = true }
		local k = vim.keymap.set
		k("n", "<C-k>", vim.lsp.buf.signature_help, bo)
		k("n", "gD", vim.lsp.buf.declaration, vim.tbl_extend("force", bo, { desc = "Get Declaration" }))
		k("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", bo, { desc = "Get Definition" }))
		k("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", bo, { desc = "Hover" }))
		k("n", "gI", vim.lsp.buf.implementation, vim.tbl_extend("force", bo, { desc = "Get Implementation" }))
		k({ "n", "i" }, "<C-h>", vim.lsp.buf.signature_help, vim.tbl_extend("force", bo, { desc = "Signature Help" }))
		k("n", "gr", vim.lsp.buf.references, vim.tbl_extend("force", bo, { desc = "Get References" }))
		k("n", "gl", vim.diagnostic.open_float, vim.tbl_extend("force", bo, { desc = "Open Float" }))
		k({ "n", "v" }, "<space>la", vim.lsp.buf.code_action, vim.tbl_extend("force", bo, { desc = "Code Actions" }))
		k("n", "<space>lr", vim.lsp.buf.rename, vim.tbl_extend("force", bo, { desc = "LSP Rename" }))
		k("n", "<leader>li", "<cmd>LspInfo<cr>", vim.tbl_extend("force", bo, { desc = "LSP Info" }))
		k("n", "<leader>lI", "<cmd>Mason<cr>", vim.tbl_extend("force", bo, { desc = "LSP Installer (Mason)" }))
		k("n", "<leader>lj", vim.diagnostic.goto_next, vim.tbl_extend("force", bo, { desc = "Next Diagnostic" }))
		k("n", "<leader>lk", vim.diagnostic.goto_prev, vim.tbl_extend("force", bo, { desc = "Previous Diagnostic" }))
		k("n", "<leader>lq", vim.diagnostic.setloclist, vim.tbl_extend("force", bo, { desc = "Diagnostic List" }))
	end,
})

-- Doc string
keymap("n", "<leader>ld", "<cmd>Neogen<cr>", vim.tbl_extend("force", opts, { desc = "Generate Doc String" }))
-- Returns group_names for which key
return { group_names = group_names }
