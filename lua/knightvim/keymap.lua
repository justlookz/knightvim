local nmap = function(left, right, dsc)
    local opts = { noremap = true, silent = true, desc = dsc }
    vim.keymap.set("n", left, right, opts)
end

local wk = require("which-key")

wk.register({
    ["<leader>f"] = { name = "find ..." }
})

nmap("<leader>", "<nop>", "Leader Menu")
nmap("<leader>w", ":write<cr>", "Save")
nmap("<leader>q", vim.cmd.qall, "Quit")
nmap("H", vim.cmd.BufferLineCyclePrev, "Previous Buffer")
nmap("L", vim.cmd.BufferLineCycleNext, "Next Buffer")
nmap("<leader>ff", ':Telescope find_files<cr>', "Find file")
nmap("<leader>fc", ":Telescope colorscheme<cr>", "Colorscheme")
nmap("<leader>e", vim.cmd.Lexplore, "File explorer")
nmap("<leader>u", vim.cmd.UndotreeToggle, "Undo Tree Structure")
nmap("<leader>e", vim.cmd.NvimTreeToggle, "File Explorer")
