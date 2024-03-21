local toggler = require("toggler.functions")

local map = vim.keymap.set

-- Basic Keymaps
map(
    "n", "<leader>", "<nop>",
    { desc = "Leader Menu" }
)
map(
    "n", "<leader>w",
    vim.cmd.write, { desc = "Save" }
)
map("n", "<leader>q", vim.cmd.qall, { desc = "Quit" })
map("n", "<leader>x", vim.cmd.bdelete, { desc = "Close Buffer" })


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

-- UI settings with or without persistent
map(
    "n",
    "<leader>usn",
    function() toggler.toggle("number") end,
    { desc = "Toggle Numbers" }
)

map(
    "n",
    "<leader>usr",
    function() toggler.toggle("rnu") end,
    { desc = "Toggle relative Numbers" }
)

map(
    "n",
    "<leader>usc",
    function() toggler.toggle("confirm") end,
    { desc = "Toggle Confirm" }
)

map(
    "n",
    "<leader>usw",
    function() toggler.toggle("wrap") end,
    { desc = "Toggle wrap" }
)

map(
    "n",
    "<leader>use",
    function() toggler.toggle("expandtab") end,
    { desc = "Toggle Space or Tab" }
)

map(
    "n",
    "<leader>usm",
    function() toggler.toggle_with_states("bg", "dark", "light") end,
    { desc = "Toggle bg mode" }
)

map(
    "n",
    "<leader>usl",
    function()
        toggler.toggle_with_states("colorcolumn", "64,78", "")
    end,
    { desc = "Toggle Horizontal lines" }
)

map(
    "n",
    "<leader>ut",
    "<CMD>7split | terminal<CR>",
    { desc = "Terminal" }
)

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
