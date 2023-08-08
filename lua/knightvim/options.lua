vim.g.mapleader = kvim.leader
local o = vim.o

-- the list for the options are from
-- https://github.com/brainfucksec/neovim-lua/blob/main/nvim/lua/core/options.lua

-- General
o.mouse = 'a'                               -- Enable mouse support
o.clipboard = 'unnamedplus'                 -- Copy/paste to system clipboard
o.swapfile = false                          -- Don't use swapfile
o.completeopt = 'menuone,noinsert,noselect' -- Autocomplete options

-- Neovim UI
o.number = true         -- Show line number
o.showmatch = true      -- Highlight matching parenthesis
o.foldmethod = 'marker' -- Enable folding (default 'foldmarker')
o.colorcolumn = '64,78' -- Line lenght marker at 80 columns
o.splitright = true     -- Vertical split to the right
o.splitbelow = true     -- Horizontal split to the bottom
o.ignorecase = true     -- Ignore case letters when search
o.smartcase = true      -- Ignore lowercase for the whole pattern
o.linebreak = true      -- Wrap on word boundary
o.termguicolors = true  -- Enable 24-bit RGB colors
o.laststatus = 3        -- Set global statusline
o.encoding = 'utf-8'
o.confirm = true
o.shortmess = "IfilnxtToOF"


-- Tabs, indent
o.expandtab = true   -- Use spaces instead of tabs
o.shiftwidth = 4     -- Shift 4 spaces when tab
o.tabstop = 4        -- 1 tab == 4 spaces
o.smartindent = true -- Autoindent new lines

-- Memory, CPU
o.hidden = true     -- Enable background buffers
o.history = 100     -- Remember N lines in history
o.lazyredraw = true -- Faster scrolling
o.synmaxcol = 120   -- Max column for syntax highlight
o.updatetime = 250  -- ms to wait for trigger an event
o.undofile = true   -- Persistent Undo History

o.timeout = true
o.timeoutlen = 300
