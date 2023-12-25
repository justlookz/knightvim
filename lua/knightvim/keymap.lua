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
nmap("<leader>w", ":write<cr>", "Save")
nmap("<leader>q", vim.cmd.qall, "Quit")
nmap("<leader>x", vim.cmd.bdelete, "Close Buffer")
nmap("H", vim.cmd.BufferLineCyclePrev, "Previous Buffer")
nmap("L", vim.cmd.BufferLineCycleNext, "Next Buffer")


-- buffer swapping
nmap("<C-h>", function()
        vim.cmd.wincmd("h")
    end,
    "goto left")

nmap("<C-left>", function()
        vim.cmd.wincmd("h")
    end,
    "goto left")

nmap("<C-l>", function()
        vim.cmd.wincmd("l")
    end,
    "goto right")

nmap("<C-right>", function()
        vim.cmd.wincmd("l")
    end,
    "goto right")

nmap("<C-k>", function()
        vim.cmd.wincmd("k")
    end,
    "go above")

nmap("<C-up>", function()
        vim.cmd.wincmd("k")
    end,
    "go above")


nmap("<C-j>", function()
        vim.cmd.wincmd("j")
    end,
    "go below")

nmap("<C-down>", function()
        vim.cmd.wincmd("j")
    end,
    "go below")

nmap(
    "<leader>ud",
    require("dapui").toggle,
    "Dap Ui toggle"
)

-- Lazy - Package manager
nmap("<leader>LL", vim.cmd.Lazy, "Open")

nmap("<leader>Ls", function()
    vim.cmd.Lazy("sync")
end, "Sync")

nmap("<leader>Lu", function()
    vim.cmd.Lazy("update")
end, "Update")

nmap("<leader>Lr", function()
    vim.cmd.Lazy("restore")
end, "Restore")


-- UI settings with or without persistent
nmap("<leader>usn", function()
    toggler.toggle("number")
end, "Toggle Numbers")

nmap("<leader>usr", function()
    toggler.toggle("rnu")
end, "Toggle relative Numbers")

nmap("<leader>usc", function()
    toggler.toggle("confirm")
end, "Toggle Confirm")

nmap("<leader>ut", function()
    vim.cmd("7split | terminal")
end, "Terminal")
