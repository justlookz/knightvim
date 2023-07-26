local nmap = function(left, right, dsc)
    local opts = { noremap = true, silent = true, desc = dsc }
    vim.keymap.set("n", left, right, opts)
end

local Telescope_builtins = require("telescope.builtin")
local wk = require("which-key")

wk.register({
    ["<leader>s"] = { name = "search" }
})

nmap("<leader>", "<nop>", "Leader Menu")
nmap("<leader>w", ":write<cr>", "Save")
nmap("<leader>q", vim.cmd.qall, "Quit")
nmap("H", vim.cmd.BufferLineCyclePrev, "Previous Buffer")
nmap("L", vim.cmd.BufferLineCycleNext, "Next Buffer")
nmap("<leader>sf", Telescope_builtins.find_files, "Find file")
nmap("<leader>sh", Telescope_builtins.help_tags, ":help options")
nmap("<leader>sc", function()
        Telescope_builtins.colorscheme({
            enable_preview = true,
        })
    end,
    "Colorscheme"
)
nmap("<leader>u", vim.cmd.UndotreeToggle, "Undo Tree Structure")
nmap("<leader>e", vim.cmd.NvimTreeToggle, "File Explorer")
