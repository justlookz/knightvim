local nmap = function(left, right, dsc)
    local opts = { noremap = true, silent = true, desc = dsc }
    vim.keymap.set("n", left, right, opts)
end

local wk = require("which-key")

nmap("H", vim.cmd.BufferLineCyclePrev, "Previous Buffer")
nmap("L", vim.cmd.BufferLineCycleNext, "Next Buffer")

wk.register({
    ["<leader>s"] = { name = "search" },
    ["<leader>t"] = { name = "Trouble" }
})

nmap("<leader>", "<nop>", "Leader Menu")
nmap("<leader>w", ":write<cr>", "Save")
nmap("<leader>q", vim.cmd.qall, "Quit")

nmap("<leader>sf", require("telescope.builtin").find_files, "Find file")
nmap("<leader>sh", require("telescope.builtin").help_tags, ":help options")
nmap("<leader>st", require("telescope.builtin").filetypes, ":help options")
nmap("<leader>sc", function()
        require("telescope.builtin").colorscheme({
            enable_preview = true,
        })
    end,
    "Colorscheme"
)

nmap("<leader>u", vim.cmd.UndotreeToggle, "Undo Tree Structure")
nmap("<leader>e", vim.cmd.NvimTreeToggle, "File Explorer")

nmap("<leader>tt", require("trouble").open, "Open Trouble")
nmap("<leader>td", function()
        require("trouble").open("todo")
    end,
    "Todos"
)
