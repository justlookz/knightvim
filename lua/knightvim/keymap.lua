--- Helper function wraper for keymap
--- @param left string | table : The shortcut that is created
--- @param right string | function : The shortcut or function that is
--- going to be executed
--- @param dsc string : Is the description of the shortcut
--- useful for Which-key and nmap command to see what the
--- Command is doing at a glance
local nmap = function(left, right, dsc)
    local opts = { noremap = true, silent = true, desc = dsc }
    vim.keymap.set("n", left, right, opts)
end

local toggler = require("knightvim.toggler.functions")
-- Basic Keymaps
nmap("<leader>", "<nop>", "Leader Menu")
nmap("<leader>w", vim.cmd.write, "Save")
nmap("<leader>q", vim.cmd.qall, "Quit")
nmap("<leader>x", vim.cmd.bdelete, "Close Buffer")
nmap("H", vim.cmd.BufferLineCyclePrev, "Previous Buffer")
nmap("L", vim.cmd.BufferLineCycleNext, "Next Buffer")


-- buffer swapping
nmap(
    "<C-h>",
    function()
        vim.cmd.wincmd("h")
    end,
    "goto left"
)

nmap("<C-left>", function()
        vim.cmd.wincmd("h")
    end,
    "goto left"
)

nmap(
    "<C-l>",
    function()
        vim.cmd.wincmd("l")
    end,
    "goto right"
)

nmap("<C-right>", function()
        vim.cmd.wincmd("l")
    end,
    "goto right")

nmap(
    "<C-k>",
    function()
        vim.cmd.wincmd("k")
    end,
    "go above"
)

nmap(
    "<C-up>",
    function()
        vim.cmd.wincmd("k")
    end,
    "go above"
)


nmap("<C-j>",
    function()
        vim.cmd.wincmd("j")
    end,
    "go below"
)

nmap(
    "<C-down>",
    function()
        vim.cmd.wincmd("j")
    end,
    "go below"
)

-- Lazy - Package manager
nmap("<leader>LL", "<cmd>Lazy<cr>", "Open Lazy [Package manager]")

nmap("<leader>Ls",
    "<cmd>Lazy sync<cr>", "Sync")

nmap("<leader>Lu",
    "<cmd>Lazy update<cr>", "Update")

nmap("<leader>Lr",
    "<cmd>Lazy restore<cr>", "Restore")


-- UI settings with or without persistent
nmap(
    "<leader>usn",
    function()
        toggler.toggle("number")
    end,
    "Toggle Numbers"
)

nmap(
    "<leader>usr",
    function()
        toggler.toggle("rnu")
    end,
    "Toggle relative Numbers"
)

nmap(
    "<leader>usc",
    function()
        toggler.toggle("confirm")
    end,
    "Toggle Confirm"
)

nmap(
    "<leader>usw",
    function()
        toggler.toggle("wrap")
    end,
    "Toggle wrap"
)

nmap(
    "<leader>use",
    function()
        toggler.toggle("expandtab")
    end,
    "Toggle Space or Tab"
)

nmap(
    "<leader>usm",
    function()
        toggler.toggle_with_states("bg", "dark", "light")
    end,
    "Toggle bg mode"
)

nmap(
    "<leader>usl",
    function()
        toggler.toggle_with_states("colorcolumn", "64,78", "")
    end,
    "Toggle Horizontal lines"
)

nmap(
    "<leader>ut",
    "<cmd>7split | terminal<cr>",
    "Terminal"
)

vim.keymap.set(
    "i", "<C-j>",
    "<esc>:m .+1<cr>==gi",
    { desc = "move down" })

vim.keymap.set(
    "i", "<C-k>",
    "<Esc>:m .-2<CR>==gi",
    { desc = "move down" }
)

vim.keymap.set(
    "n", "<C-j>",
    ":m .+1<cr>==",
    { desc = "move down" })

vim.keymap.set(
    "n", "<C-k>",
    ":m .-2<CR>==",
    { desc = "move down" }
)

vim.keymap.set(
    "v", "<C-j>",
    ":m '>+1<cr>gv=gv",
    { desc = "move down" })

vim.keymap.set(
    "v", "<C-k>",
    ":m '<-2<CR>gv=gv",
    { desc = "move down" }
)
