local nmap = function(left, right, dsc)
    local opts = { noremap = true, silent = true, desc = dsc }
    vim.keymap.set("n", left, right, opts)
end

local wk = require("which-key")

nmap("H", vim.cmd.BufferLineCyclePrev, "Previous Buffer")
nmap("L", vim.cmd.BufferLineCycleNext, "Next Buffer")

wk.register({
    ["<leader>s"] = { name = "Search" },
    ["<leader>t"] = { name = "Trouble" },
    ["<leader>sg"] = { name = "Git" },
    --["<leader>b"] = { name = "Buffer" }
})

-- Basic Keymaps
nmap("<leader>", "<nop>", "Leader Menu")
nmap("<leader>w", ":write<cr>", "Save")
nmap("<leader>q", vim.cmd.qall, "Quit")
nmap("<leader>c", vim.cmd.bdelete, "Quit")

-- buffer swapping
nmap("<C-h>", function()
        vim.cmd.wincmd("h")
    end,
    "goto left")

nmap("<C-l>", function()
        vim.cmd.wincmd("l")
    end,
    "goto right")

nmap("<C-k>", function()
        vim.cmd.wincmd("k")
    end,
    "go above")

nmap("<C-j>", function()
        vim.cmd.wincmd("j")
    end,
    "go below")


-- Telescope Searches
nmap("<leader>sf", function()
        require("telescope.builtin")
            .find_files(require("telescope.themes").get_dropdown())
    end,
    "Find file")

nmap("<leader>sh", function()
        require("telescope.builtin")
            .help_tags(require("telescope.themes")
                .get_dropdown())
    end,
    ":help options")

nmap("<leader>st", function()
    require("telescope.builtin")
        .filetypes(require("telescope.themes")
            .get_dropdown())
end
, "filetypes")

nmap("<leader>sw", function()
        require("telescope.builtin")
            .live_grep(require("telescope.themes")
                .get_dropdown())
    end,
    "Find words")

nmap("<leader>sgf", function()
        require("telescope.builtin")
            .git_files(require("telescope.themes")
                .get_dropdown())
    end,
    "Find file")

nmap("<leader>sgw", function()
        -- code
        require("telescope.builtin")
            .grep_string(require("telescope.themes")
                .get_dropdown())
    end,
    "Find words")

nmap("<leader>sgc", function()
        require("telescope.builtin")
            .git_commits(require("telescope.themes")
                .get_dropdown())
    end,
    "Find commit")

nmap("<leader>sc", function()
        require("telescope.builtin").colorscheme(require("telescope.themes")
            .get_dropdown({
                enable_preview = true,
            }))
    end,
    "Colorscheme"
)

-- Undo Tree
nmap("<leader>u", vim.cmd.UndotreeToggle, "Undo Tree Structure")

-- File Explorer
nmap("<leader>e", vim.cmd.NvimTreeToggle, "File Explorer")

-- Trouble Debug menu
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
