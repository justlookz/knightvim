vim.g.mapleader      = kvim.leader

-- the list for the options are from
-- https://github.com/brainfucksec/neovim-lua/blob/main/nvim/lua/core/options.lua

-- General
vim.o.mouse          = 'a'                         -- Enable mouse support
vim.o.clipboard      = 'unnamedplus'               -- Copy/paste to system clipboard
vim.o.swapfile       = false                       -- Don't use swapfile
vim.o.completeopt    = 'menuone,noinsert,noselect' -- Autocomplete options

-- Neovim UI
vim.o.number         = true     -- Show line number
vim.o.showmatch      = true     -- Highlight matching parenthesis
vim.o.foldmethod     = 'marker' -- Enable folding (default 'foldmarker')
vim.o.colorcolumn    = '64,78'  -- Line lenght marker at 80 columns
vim.o.splitright     = true     -- Vertical split to the right
vim.o.splitbelow     = true     -- Horizontal split to the bottom
vim.o.ignorecase     = true     -- Ignore case letters when search
vim.o.smartcase      = true     -- Ignore lowercase for the whole pattern
vim.o.linebreak      = true     -- Wrap on word boundary
vim.o.termguicolors  = true     -- Enable 24-bit RGB colors
vim.o.laststatus     = 3        -- Set global statusline
vim.o.encoding       = 'utf-8'
vim.o.confirm        = true
vim.o.shortmess      = "IfilnxtToOF"
vim.o.number         = true
vim.o.relativenumber = true


-- Tabs, indent
vim.o.expandtab = true   -- Use spaces instead of tabs
vim.o.shiftwidth = 4     -- Shift 4 spaces when tab
vim.o.tabstop = 4        -- 1 tab == 4 spaces
vim.o.smartindent = true -- Autoindent new lines

-- Memory, CPU{{{
vim.o.hidden = true     -- Enable background buffers
vim.o.history = 100     -- Remember N lines in history
vim.o.lazyredraw = true -- Faster scrolling
vim.o.synmaxcol = 120   -- Max column for syntax highlight
vim.o.updatetime = 250  -- ms to wait for trigger an event
vim.o.undofile = true   -- Persistent Undo History

vim.o.timeout = true
vim.o.timeoutlen = 300 -- }}}

vim.opt.foldmethod = "marker"
