local toggler = require("toggler.functions")

local map = vim.keymap.set

-- Basic Keymaps
map(
    "n", "<leader>", "<nop>",
    { desc = "Leader Menu" }
)
map("n", "<leader>x", vim.cmd.bdelete, { desc = "Close Buffer" })

map("n", "<esc>", vim.cmd.nohlsearch)

map("v", ">", ">gv", { desc = "Left indentation" })

map("v", "<", "<gv", { desc = "Right indentation" })
-- Delete character without removing registers
map("n", "x", '"_x', { noremap = true })
-- buffer swapping
map(
    "n",
    "<C-h>",
    function() vim.cmd.wincmd("h") end,
    { desc = "goto left" }
)

map(
    "n",
    "<C-left>",
    function() vim.cmd.wincmd("h") end,
    { desc = "goto left" }
)

map(
    "n",
    "<C-l>",
    function() vim.cmd.wincmd("l") end,
    { desc = "goto right" }
)

map(
    "n", "<C-right>",
    function() vim.cmd.wincmd("l") end,
    { desc = "goto right" }
)

map(
    "n", "<C-k>",
    function() vim.cmd.wincmd("k") end,
    { desc = "go above" }
)

map(
    "n",
    "<C-up>",
    function() vim.cmd.wincmd("k") end,
    { desc = "go above" }
)


map(
    "n",
    "<C-j>",
    function() vim.cmd.wincmd("j") end,
    { desc = "go below" }
)

map(
    "n",
    "<C-down>",
    function() vim.cmd.wincmd("j") end,
    { desc = "go below" }
)

-- Lazy - Package manager
map(
    "n",
    "<leader>LL",
    "<CMD>Lazy<CR>",
    { desc = "Open Lazy [Package manager]" }
)

map(
    "n",
    "<leader>Ls",
    "<CMD>Lazy sync<CR>",
    { desc = "Sync" }
)

map(
    "n",
    "<leader>Lu",
    "<CMD>Lazy update<CR>",
    { desc = "Update" }
)

map(
    "n",
    "<leader>Lr",
    "<CMD>Lazy restore<CR>",
    { desc = "Restore" }
)

map(
    "n",
    "<leader>Lp",
    "<CMD>Lazy profile<CR>",
    { desc = "Profile" }
)

-- Toggler is gonna get deprecated soon
-- UI settings with or without persistent
map( -- persistent
    "n",
    "<leader>usn",
    function() toggler.toggle("number") end,
    { desc = "Toggle Numbers" }
)

map( -- persistent
    "n",
    "<leader>usr",
    function() toggler.toggle("rnu") end,
    { desc = "Toggle relative Numbers" }
)

map( -- persistent
    "n",
    "<leader>usc",
    function() toggler.toggle("confirm") end,
    { desc = "Toggle Confirm" }
)

map( -- persistent
    "n",
    "<leader>usw",
    function() toggler.toggle("wrap") end,
    { desc = "Toggle wrap" }
)

-- If tabs are used like tab or spaces
map( -- persistent
    "n",
    "<leader>use",
    function() toggler.toggle("expandtab") end,
    { desc = "Toggle Space or Tab" }
)

-- Dark light mode if theme support it
map( -- persistent
    "n",
    "<leader>usm",
    function() toggler.toggle_with_states("bg", "dark", "light") end,
    { desc = "Toggle bg mode" }
)

-- Add remove vertical lines at 64 78 col lines
map( -- persistent
    "n",
    "<leader>usl",
    function()
        toggler.toggle_with_states("colorcolumn", "64,78", "")
    end,
    { desc = "Toggle Horizontal lines" }
)

-- Terminal on split window
map(
    "n",
    "<leader>ut",
    "<CMD>7split | terminal<CR>",
    { desc = "Terminal" }
)

-- Text movement
map(
    "i",
    "<A-j>",
    "<esc><CMD>m .+1<CR>==gi",
    { desc = "move down" }
)

map(
    "i",
    "<A-k>",
    "<Esc><CMD>m .-2<CR>==gi",
    { desc = "move up" }
)

map(
    "n",
    "<A-j>",
    "<CMD>m .+1<CR>==",
    { desc = "move down" }
)

map(
    "n",
    "<A-k>",
    "<CMD>m .-2<CR>==",
    { desc = "move up" }
)

map(
    "v",
    "<A-j>",
    ":m '>+1<CR>gv=gv",
    { desc = "move down" }
)

map(
    "v",
    "<A-k>",
    ":m '<-2<CR>gv=gv",
    { desc = "move up" }
)

-- Centered movement
map(
    "n",
    "<C-d>",
    "<C-d>zz",
    { desc = "Fast moving down and centered" }
)

map(
    "n",
    "<C-u>",
    "<C-u>zz",
    { desc = "Fast moving down and centered" }
)

-- Swap buffer
map(
    "n",
    "L",
    vim.cmd.bnext,
    { desc = "Go to next buffer" }
)

map(
    "n",
    "H",
    vim.cmd.bprev,
    { desc = "Go to previous buffer" }
)

map("t", "<ESC>", "<C-\\><C-n>")

map("n", "<leader>Ku", function()
    local tmp = vim.cmd.pwd()
    local path = vim.fn.getenv("MYVIMRC")
    path = path:sub(0, -9)
    vim.cmd("cd " .. vim.fn.getenv("VIM"))
    vim.cmd("! git pull origin main")
    vim.cmd("cd" .. tmp)
end, { desc = "Kvim update to latest" })
