local toggler = require("knightvim.toggler.functions")
-- Basic Keymaps
vim.keymap.set(
    "n", "<leader>", "<nop>",
    { desc = "Leader Menu" }
)
vim.keymap.set(
    "n", "<leader>w",
    vim.cmd.write, { desc = "Save" }
)
vim.keymap.set("n", "<leader>q", vim.cmd.qall, { desc = "Quit" })
vim.keymap.set("n", "<leader>x", vim.cmd.bdelete, { desc = "Close Buffer" })


-- buffer swapping
vim.keymap.set(
    "n", "<A-h>",
    function()
        vim.cmd.wincmd("h")
    end,
    { desc = "goto left" }
)

vim.keymap.set(
    "n", "<A-left>",
    function()
        vim.cmd.wincmd("h")
    end,
    { desc = "goto left" }
)

vim.keymap.set(
    "n", "<A-l>",
    function()
        vim.cmd.wincmd("l")
    end,
    { desc = "goto right" }
)

vim.keymap.set(
    "n", "<A-right>",
    function()
        vim.cmd.wincmd("l")
    end,
    { desc = "goto right" }
)

vim.keymap.set(
    "n", "<A-k>",
    function()
        vim.cmd.wincmd("k")
    end,
    { desc = "go above" }
)

vim.keymap.set(
    "n", "<A-up>",
    function()
        vim.cmd.wincmd("k")
    end,
    { desc = "go above" }
)


vim.keymap.set(
    "n", "<A-j>",
    function()
        vim.cmd.wincmd("j")
    end,
    { desc = "go below" }
)

vim.keymap.set(
    "n", "<A-down>",
    function()
        vim.cmd.wincmd("j")
    end,
    { desc = "go below" }
)

-- Lazy - Package manager
vim.keymap.set(
    "n", "<leader>LL",
    "<cmd>Lazy<cr>",
    { desc = "Open Lazy [Package manager]" }
)

vim.keymap.set(
    "n", "<leader>Ls",
    "<cmd>Lazy sync<cr>",
    { desc = "Sync" }
)

vim.keymap.set(
    "n", "<leader>Lu",
    "<cmd>Lazy update<cr>",
    { desc = "Update" }
)

vim.keymap.set(
    "n", "<leader>Lr",
    "<cmd>Lazy restore<cr>",
    { desc = "Restore" }
)


-- UI settings with or without persistent
vim.keymap.set(
    "n", "<leader>usn",
    function()
        toggler.toggle("number")
    end,
    { desc = "Toggle Numbers" }
)

vim.keymap.set(
    "n", "<leader>usr",
    function()
        toggler.toggle("rnu")
    end,
    { desc = "Toggle relative Numbers" }
)

vim.keymap.set(
    "n", "<leader>usc",
    function()
        toggler.toggle("confirm")
    end,
    { desc = "Toggle Confirm" }
)

vim.keymap.set(
    "n", "<leader>usw",
    function()
        toggler.toggle("wrap")
    end,
    { desc = "Toggle wrap" }
)

vim.keymap.set(
    "n", "<leader>use",
    function()
        toggler.toggle("expandtab")
    end,
    { desc = "Toggle Space or Tab" }
)

vim.keymap.set(
    "n", "<leader>usm",
    function()
        toggler.toggle_with_states("bg", "dark", "light")
    end,
    { desc = "Toggle bg mode" }
)

vim.keymap.set(
    "n", "<leader>usl",
    function()
        toggler.toggle_with_states("colorcolumn", "64,78", "")
    end,
    { desc = "Toggle Horizontal lines" }
)

vim.keymap.set(
    "n", "<leader>ut",
    "<cmd>7split | terminal<cr>",
    { desc = "Terminal" }
)

vim.keymap.set(
    "i", "<C-j>",
    "<esc>:m .+1<cr>==gi",
    { desc = "move down" })

vim.keymap.set(
    "i", "<C-k>",
    "<Esc>:m .-2<CR>==gi",
    { desc = "move up" }
)

vim.keymap.set(
    "n", "<C-j>",
    ":m .+1<cr>==",
    { desc = "move down" })

vim.keymap.set(
    "n", "<C-k>",
    ":m .-2<CR>==",
    { desc = "move up" }
)

vim.keymap.set(
    "v", "<C-j>",
    ":m '>+1<cr>gv=gv",
    { desc = "move down" })

vim.keymap.set(
    "v", "<C-k>",
    ":m '<-2<CR>gv=gv",
    { desc = "move up" }
)

vim.keymap.set(
    "n", "<C-d>", "<C-d>zz",
    { desc = "Fast moving down and centered" }
)

vim.keymap.set(
    "n", "<C-u>", "<C-u>zz",
    { desc = "Fast moving down and centered" }
)
