local nmap = function(left, right, dsc)
    local opts = { noremap = true, silent = true, desc = dsc }
    vim.keymap.set("n", left, right, opts)
end

local wk = require("which-key")

nmap("H", vim.cmd.BufferLineCyclePrev, "Previous Buffer")
nmap("L", vim.cmd.BufferLineCycleNext, "Next Buffer")

wk.register({
    ["<leader>s"] = { name = "search" },
    ["<leader>t"] = { name = "Trouble" },
    ["<leader>sg"] = { name = "Git" },
    ["<leader>b"] = { name = "Buffer" }
})

nmap("<leader>", "<nop>", "Leader Menu")
nmap("<leader>w", ":write<cr>", "Save")
nmap("<leader>q", vim.cmd.qall, "Quit")
nmap("<leader>c", vim.cmd.bdelete, "Quit")
nmap("<leader>bh", function()
        vim.cmd.wincmd("h")
    end,
    "goto left")
nmap("<leader>bl", function()
        vim.cmd.wincmd("l")
    end,
    "goto right")
nmap("<leader>bk", function()
        vim.cmd.wincmd("k")
    end,
    "go above")
nmap("<leader>bj", function()
        vim.cmd.wincmd("j")
    end,
    "go below")


nmap("<leader>sf", require("telescope.builtin").find_files, "Find file")
nmap("<leader>sh", require("telescope.builtin").help_tags, ":help options")
nmap("<leader>st", require("telescope.builtin").filetypes, "filetypes")
nmap("<leader>sw", require("telescope.builtin").live_grep, "Find words")
nmap("<leader>sgf", require("telescope.builtin").git_files, "Find file")


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
nmap("<leader>tq", function()
        require("trouble").open("quickfix")
    end,
    "Quickfix"
)
nmap("<leader>tw", function()
        require("trouble").open("workspace_diagnostics")
    end,
    "Workspace Diagnostics"
)
