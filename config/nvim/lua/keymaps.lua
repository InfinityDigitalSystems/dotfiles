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

-- Init table for which key group names (which key acesses this if loaded)
local group_names = {}

--Remap space as leader key
keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Remove the f1 mapping
keymap("n", "<F1>", "<Nop>", { noremap = true, silent = true })
keymap("i", "<F1>", "<Nop>", { noremap = true, silent = true })
keymap("v", "<F1>", "<Nop>", { noremap = true, silent = true })
keymap("x", "<F1>", "<Nop>", { noremap = true, silent = true })

-- add standard motion bindings to insert mode
keymap("i", "<C-BS>", "<C-W>", { noremap = true, silent = true })
keymap("n", "<C-Backspace>", "daw", { noremap = true, silent = true })

-- Resize windows using alt + shift + [hjkl]
keymap("n", "<CS-up>", ":resize +2<CR>", { noremap = true, silent = true })
keymap("n", "<CS-down>", ":resize -2<CR>", { noremap = true, silent = true })
keymap("n", "<CS-left>", ":vertical resize -2<CR>", { noremap = true, silent = true })
keymap("n", "<CS-right>", ":vertical resize +2<CR>", { noremap = true, silent = true })
keymap("n", "<CS-k>", ":resize +2<CR>", { noremap = true, silent = true })
keymap("n", "<CS-j>", ":resize -2<CR>", { noremap = true, silent = true })
keymap("n", "<CS-h>", ":vertical resize -2<CR>", { noremap = true, silent = true })
keymap("n", "<CS-l>", ":vertical resize +2<CR>", { noremap = true, silent = true })

-- Shift focus between windows using alt + [hjkl]
keymap("n", "<C-left>", "<C-w>h", { noremap = true, silent = true })
keymap("n", "<C-down>", "<C-w>j", { noremap = true, silent = true })
keymap("n", "<C-up>", "<C-w>k", { noremap = true, silent = true })
keymap("n", "<C-right>", "<C-w>l", { noremap = true, silent = true })
keymap("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
keymap("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
keymap("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
keymap("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

-- Terminal --
-- Close toggle term if escape pressed
keymap("t", "<esc>", [[<A-\><C-n>]], { silent = true })

-- Move Blocks around --
-- Stay in indent mode
keymap("v", "<", "<gv", { noremap = true, silent = true })
keymap("v", ">", ">gv", { noremap = true, silent = true })
keymap("v", "<C-,>", "<gv", { noremap = true, silent = true })
keymap("v", "<C-.>", ">gv", { noremap = true, silent = true })
keymap("v", "<C-left>", "<gv", { noremap = true, silent = true })
keymap("v", "<C-right>", ">gv", { noremap = true, silent = true })
keymap("v", "<C-h>", "<gv", { noremap = true, silent = true })
keymap("v", "<C-l>", ">gv", { noremap = true, silent = true })
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", { noremap = true, silent = true })
keymap("x", "K", ":move '<-2<CR>gv-gv", { noremap = true, silent = true })
keymap("x", "<C-j>", ":move '>+1<CR>gv-gv", { noremap = true, silent = true })
keymap("x", "<C-k>", ":move '<-2<CR>gv-gv", { noremap = true, silent = true })
keymap("x", "<C-down>", ":move '>+1<CR>gv-gv", { noremap = true, silent = true })
keymap("x", "<C-up>", ":move '<-2<CR>gv-gv", { noremap = true, silent = true })

-- Splits
table.insert(group_names, { s = { name = "Splits" } })
keymap("n", "<leader>sv", ":vsplit<CR>", { noremap = true, silent = true, desc = "Vertical Split" })
keymap("n", "<leader>sh", ":split<CR>", { noremap = true, silent = true, desc = "Horizontal Split" })
keymap("n", "<leader>sk", "<C-w>c", { noremap = true, silent = true, desc = "Window Kill" })

-- Buffers
-- Cylce through Buffers
table.insert(group_names, { b = { name = "Buffers" } })
keymap("n", "<C-o>", ":bprevious<CR>", { noremap = true, silent = true, desc = "Previous Buffer" })
keymap("n", "<leader>bp", ":bprevious<CR>", { noremap = true, silent = true, desc = "Previous Buffer" })
keymap("n", "<C-p>", ":bnext<CR>", { noremap = true, silent = true, desc = "Next Buffer" })
keymap("n", "<leader>bn", ":bnext<CR>", { noremap = true, silent = true, desc = "Next Buffer" })
keymap("n", "<CS-TAB>", ":bprevious<CR>", { noremap = true, silent = true, desc = "Previous Buffer" })
keymap("n", "<C-TAB>", ":bnext<CR>", { noremap = true, silent = true, desc = "Next Buffer" })
keymap("n", "<C-PageUp>", ":bprevious<CR>", { noremap = true, silent = true, desc = "Previous Buffer" })
keymap("n", "<C-PageDown>", ":bnext<CR>", { noremap = true, silent = true, desc = "Next Buffer" })
-- Close buffer
keymap("n", "<leader>bk", ":Bdelete<CR>", { noremap = true, silent = true, desc = "Kill Buffer" })
keymap("n", "<C-w>", ":Bdelete<CR>", { noremap = true, silent = true, desc = "Kill Buffer" })
-- Switch between buffers
keymap("n", "<leader>bs", "<cmd>Telescope buffers<cr>", { noremap = true, silent = true, desc = "Search Buffers" })
keymap("n", "<C-TAB>", "<cmd>Telescope buffers<cr>", { noremap = true, silent = true, desc = "Search Buffers" })
keymap(
	"n",
	"<leader>b1",
	"<cmd>:BufferLineGoToBuffer 1<cr>",
	{ noremap = true, silent = true, desc = "Navigate to file 1" }
)
keymap("n", "<C-1>", "<cmd>:BufferLineGoToBuffer 1<cr>", { noremap = true, silent = true, desc = "Navigate to file 1" })
keymap(
	"n",
	"<leader>b2",
	"<cmd>:BufferLineGoToBuffer 2<cr>",
	{ noremap = true, silent = true, desc = "Navigate to file 2" }
)
keymap("n", "<C-2>", "<cmd>:BufferLineGoToBuffer 2<cr>", { noremap = true, silent = true, desc = "Navigate to file 2" })
keymap(
	"n",
	"<leader>b3",
	"<cmd>:BufferLineGoToBuffer 3<cr>",
	{ noremap = true, silent = true, desc = "Navigate to file 3" }
)
keymap("n", "<C-3>", "<cmd>:BufferLineGoToBuffer 3<cr>", { noremap = true, silent = true, desc = "Navigate to file 3" })
keymap(
	"n",
	"<leader>b4",
	"<cmd>:BufferLineGoToBuffer 4<cr>",
	{ noremap = true, silent = true, desc = "Navigate to file 4" }
)
keymap("n", "<C-4>", "<cmd>:BufferLineGoToBuffer 4<cr>", { noremap = true, silent = true, desc = "Navigate to file 4" })
keymap(
	"n",
	"<leader>b5",
	"<cmd>:BufferLineGoToBuffer 5<cr>",
	{ noremap = true, silent = true, desc = "Navigate to file 5" }
)
keymap("n", "<C-5>", "<cmd>:BufferLineGoToBuffer 5<cr>", { noremap = true, silent = true, desc = "Navigate to file 5" })
keymap(
	"n",
	"<leader>b6",
	"<cmd>:BufferLineGoToBuffer 6<cr>",
	{ noremap = true, silent = true, desc = "Navigate to file 6" }
)
keymap("n", "<C-6>", "<cmd>:BufferLineGoToBuffer 6<cr>", { noremap = true, silent = true, desc = "Navigate to file 6" })
keymap(
	"n",
	"<leader>b7",
	"<cmd>:BufferLineGoToBuffer 7<cr>",
	{ noremap = true, silent = true, desc = "Navigate to file 7" }
)
keymap("n", "<C-7>", "<cmd>:BufferLineGoToBuffer 7<cr>", { noremap = true, silent = true, desc = "Navigate to file 7" })
keymap(
	"n",
	"<leader>b8",
	"<cmd>:BufferLineGoToBuffer 8<cr>",
	{ noremap = true, silent = true, desc = "Navigate to file 8" }
)
keymap("n", "<C-8>", "<cmd>:BufferLineGoToBuffer 8<cr>", { noremap = true, silent = true, desc = "Navigate to file 8" })
keymap(
	"n",
	"<leader>b9",
	"<cmd>:BufferLineGoToBuffer 9<cr>",
	{ noremap = true, silent = true, desc = "Navigate to file 9" }
)
keymap("n", "<C-9>", "<cmd>:BufferLineGoToBuffer 9<cr>", { noremap = true, silent = true, desc = "Navigate to file 9" })

-- Opens tree explorer
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", { noremap = true, silent = true })
keymap(
	"n",
	"<leader>E",
	"<cmd>lua require('lf').start()<cr>",
	{ noremap = true, silent = true, desc = "Open File Manager" }
)

--excute
table.insert(group_names, { x = { name = "Execute software" } })
keymap(
	"n",
	"<leader>xe",
	"<cmd>lua require('lf').start()<cr>",
	{ noremap = true, silent = true, desc = "Open File Manager" }
)
keymap("n", "<leader>xg", "<cmd>lua _LAZYGIT_TOGGLE_TERM()<CR>", { noremap = true, silent = true, desc = "LazyGit" })

-- Run Code
table.insert(group_names, { r = { name = "Run Code" } })
keymap("n", "<leader>rp", ":w<CR>:TermExec cmd='python %'<CR>", { noremap = true, silent = true, desc = "Run Python" })
keymap("n", "<leader>rl", ":w<CR>:TermExec cmd='lua %'<CR>", { noremap = true, silent = true, desc = "Run Lua" })
keymap("n", "<leader>rm", ":MarkdownPreview<CR>", { noremap = true, silent = true, desc = "Markdown Preview" })
keymap("n", "<leader>rwq", '<cmd>!qutebrowser "%"<cr>', { desc = "Open file in qutebrowser" })
keymap("n", "<leader>rwf", '<cmd>!firefox "%"<cr>', { desc = "Open file in firefox" })
keymap("n", "<leader>rwb", '<cmd>!brave "%"<cr>', { desc = "Open file in brave" })

-- Quit
table.insert(group_names, { q = { name = "Quit" } })
keymap("n", "<leader>qS", ":SudaWrite<CR>:xa<CR>:qa<CR>", { noremap = true, silent = true, desc = "Save as Sudo" })
keymap("n", "<leader>qq", ":xa<CR>:qa<CR>", { noremap = true, silent = true, desc = "Save Quit All" })
keymap("n", "<leader>qQ", ":qa!<CR>", { noremap = true, silent = true, desc = "Quit without saving" })
keymap("n", "<leader>Q", ":qa!<CR>", { noremap = true, silent = true, desc = "Quit without saving" })
-- Save
table.insert(group_names, { w = { name = "Save" } })
keymap("n", "<leader>wa", ":wa<CR>", { noremap = true, silent = true, desc = "Save all" })
keymap("n", "<leader>ww", ":w<CR>", { noremap = true, silent = true, desc = "Save" })
keymap("n", "<leader>wS", ":SudaWrite<CR>", { noremap = true, silent = true, desc = "Save as Sudo" })

-- Find
table.insert(group_names, { f = { name = "Find" } })
keymap(
	"n",
	"<leader>ff",
	"<cmd>Telescope find_files hidden=true<cr>",
	{ noremap = true, silent = true, desc = "Find File" }
)
keymap("n", "<leader>ft", "<cmd>Telescope live_grep<cr>", { noremap = true, silent = true, desc = "Live Grep" })
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { noremap = true, silent = true, desc = "Find Help" })
keymap("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { noremap = true, silent = true, desc = "Open Recent" })
keymap("n", "<leader>fp", "<cmd>Telescope projects<cr>", { noremap = true, silent = true, desc = "Find Project" })
keymap(
	"n",
	"<leader>f/",
	"<cmd>Telescope current_buffer_fuzzy_find<cr>",
	{ noremap = true, silent = true, desc = "Find in current Buffer" }
)

-- LSP
table.insert(group_names, { l = { name = "LSP" } })
local function lsp_keymaps(bufnr)
	local buf_keymap = vim.api.nvim_buf_set_keymap
	buf_keymap(
		bufnr,
		"n",
		"gD",
		"<cmd>lua vim.lsp.buf.declaration()<CR>",
		{ noremap = true, silent = true, desc = "Get Declaration" }
	)
	buf_keymap(
		bufnr,
		"n",
		"gd",
		"<cmd>lua vim.lsp.buf.definition()<CR>",
		{ noremap = true, silent = true, desc = "Get Definintion" }
	)
	buf_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true, desc = "Hover" })
	buf_keymap(
		bufnr,
		"n",
		"gI",
		"<cmd>lua vim.lsp.buf.implementation()<CR>",
		{ noremap = true, silent = true, desc = "Get Implementation" }
	)
	buf_keymap(
		bufnr,
		"n",
		"gr",
		"<cmd>lua vim.lsp.buf.references()<CR>",
		{ noremap = true, silent = true, desc = "Get References" }
	)
	buf_keymap(
		bufnr,
		"n",
		"gl",
		"<cmd>lua vim.diagnostic.open_float()<CR>",
		{ noremap = true, silent = true, desc = "Open Float" }
	)
	buf_keymap(
		bufnr,
		"n",
		"<leader>lf",
		"<cmd>lua vim.lsp.buf.format{ async = true }<cr>",
		{ noremap = true, silent = true, desc = "Format Buffer" }
	)
	buf_keymap(bufnr, "n", "<leader>li", "<cmd>LspInfo<cr>", { noremap = true, silent = true, desc = "LSP Info" })
	buf_keymap(
		bufnr,
		"n",
		"<leader>lI",
		"<cmd>Mason<cr>",
		{ noremap = true, silent = true, desc = "Lsp Installer (Mason)" }
	)
	buf_keymap(
		bufnr,
		"n",
		"<leader>la",
		"<cmd>lua vim.lsp.buf.code_action()<cr>",
		{ noremap = true, silent = true, desc = "Code Action" }
	)
	buf_keymap(
		bufnr,
		"n",
		"<leader>lj",
		"<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>",
		{ noremap = true, silent = true, desc = "Next Diagnostic" }
	)
	buf_keymap(
		bufnr,
		"n",
		"<leader>lk",
		"<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>",
		{ noremap = true, silent = true, desc = "Previous Diagnostic" }
	)
	buf_keymap(
		bufnr,
		"n",
		"<leader>lr",
		"<cmd>lua vim.lsp.buf.rename()<cr>",
		{ noremap = true, silent = true, desc = "Rename" }
	)
	buf_keymap(
		bufnr,
		"n",
		"<leader>ls",
		"<cmd>lua vim.lsp.buf.signature_help()<CR>",
		{ noremap = true, silent = true, desc = "Signature Help" }
	)
	buf_keymap(
		bufnr,
		"n",
		"<leader>lq",
		"<cmd>lua vim.diagnostic.setloclist()<CR>",
		{ noremap = true, silent = true, desc = "Diagnostic List" }
	)
end

-- Doc string
keymap("n", "<leader>ld", "<cmd>Neogen<cr>", { noremap = true, silent = true, desc = "Generate Doc String" })

-- Returns plugin keybinds so plugins can find them
return { group_names = group_names, lsp_keymaps = lsp_keymaps }
