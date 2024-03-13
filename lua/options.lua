vim.g.mapleader        = kvim.leader

-- the list for the options are from
-- https://github.com/brainfucksec/neovim-lua/blob/main/nvim/lua/core/options.lua

-- General
vim.opt.mouse          = 'a' -- Enable mouse support
-- No need. "* keymap load clipboard seperating them
-- vim.opt.clipboard      = 'unnamedplus'               -- Copy/paste to system clipboard
vim.opt.swapfile       = false                       -- Don't use swapfile
vim.opt.completeopt    = 'menuone,noinsert,noselect' -- Autocomplete options

-- Neovim UI
vim.opt.number         = true     -- Show line number
vim.opt.showmatch      = true     -- Highlight matching parenthesis
vim.opt.foldmethod     = 'marker' -- Enable folding (default 'foldmarker')
vim.opt.colorcolumn    = '64,78'  -- Line lenght marker at 80 columns
vim.opt.splitright     = true     -- Vertical split to the right
vim.opt.splitbelow     = true     -- Horizontal split to the bottom
vim.opt.ignorecase     = true     -- Ignore case letters when search
vim.opt.smartcase      = true     -- Ignore lowercase for the whole pattern
vim.opt.linebreak      = true     -- Wrap on word boundary
vim.opt.termguicolors  = true     -- Enable 24-bit RGB colors
vim.opt.laststatus     = 3        -- Set global statusline
vim.opt.encoding       = 'utf-8'
vim.opt.confirm        = true
vim.opt.shortmess      = "IfilnxtToOF"
vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.showmode       = false

-- Tabs, indent
vim.opt.expandtab      = true -- Use spaces instead of tabs
vim.opt.shiftwidth     = 4 -- Shift 4 spaces when tab
vim.opt.tabstop        = 4 -- 1 tab == 4 spaces
vim.opt.smartindent    = true -- Autoindent new lines

-- Memory, CPU
vim.opt.hidden         = true -- Enable background buffers
vim.opt.history        = 100 -- Remember N lines in history
vim.opt.lazyredraw     = true -- Faster scrolling
vim.opt.synmaxcol      = 120 -- Max column for syntax highlight
vim.opt.updatetime     = 250 -- ms to wait for trigger an event
vim.opt.undofile       = true -- Persistent Undo History

vim.opt.timeout        = true
vim.opt.timeoutlen     = 300
