o = vim.opt

-- Backup Settings
o.backup = false
o.writebackup = false
-- Line Number Settings
o.number = true                           -- set numbered lines
o.relativenumber = true                   -- set relative numbered lines
o.numberwidth = 1                         -- set number column width to 2 {default 4}
-- General Settings
o.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
o.title = true
o.cmdheight = 0                           -- more space in the neovim command line for displaying messages
o.completeopt = { "menuone", "noselect" } -- mostly just for cmp
o.conceallevel = 0                        -- so that `` is visible in markdown files
o.fileencoding = "utf-8"                  -- the encoding written to a file
o.hlsearch = false                        -- highlight all matches on previous search pattern
o.ignorecase = true                       -- ignore case in search patterns
o.mouse = "a"                             -- allow the mouse to be used in neovim
o.pumheight = 10                          -- pop up menu height
o.showmode = false                        -- we don't need to see things like -- INSERT -- anymore
o.showtabline = 0                         -- always show tabs
o.smartcase = true                        -- smart case
o.smartindent = true                      -- make indenting smarter again
o.splitbelow = true                       -- force all horizontal splits to go below current window
o.splitright = true                       -- force all vertical splits to go to the right of current window
o.swapfile = true                         -- creates a swapfile
o.termguicolors = true                    -- set term gui colors (most terminals support this)
o.timeoutlen = 1000                       -- time to wait for a mapped sequence to complete (in milliseconds)
o.undofile = true                         -- enable persistent undo
o.updatetime = 300                        -- faster completion (4000ms default)
o.expandtab = true                        -- convert tabs to spaces
o.shiftwidth = 2                          -- the number of spaces inserted for each indentation
o.tabstop = 2                             -- insert 2 spaces for a tab
o.cursorline = true                       -- highlight the current line
o.signcolumn = "yes"                      -- always show the sign column, otherwise it would shift the text each time
o.wrap = false                            -- display lines as one long line
o.scrolloff = 8                           -- is one of my fav
o.sidescrolloff = 8
o.guifont = "JetBrainsMono:h12"           -- the font used in graphical neovim applications
o.title = true                            -- the font used in graphical neovim applications
o.titlestring = "NVIM - %<%F%="
o.titlelen = 100
o.spelllang = "en_au"
-- o.spell = true

-- Folding is handled by lua/plugins/folding
o.foldcolumn = "0" -- '0' is not bad
o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
o.foldlevelstart = 99
o.foldenable = true

o.shortmess:append("c")

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
-- write and save current buffer
vim.cmd("cnoreabbrev wd w\\|Bdelete")
-- vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
