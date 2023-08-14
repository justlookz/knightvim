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

local wk = require("which-key")

wk.register({
    ["<leader>s"] = "Search",
    ["<leader>t"] = "Trouble",
    ["<leader>sg"] = "Git",
    ["<leader>u"] = "ui settings",
    ["<leader>ug"] = "Git signs",
    ["<leader>d"] = "Debug - Dap",
    ["<leader>L"] = "Lazy - Package manager",

    ["gt"] = "Goto type...",
    ["v]"] = "Match forward ...",
    ["v["] = "Match Backward ...",
})


-- Basic Keymaps
nmap("<leader>", "<nop>", "Leader Menu")
nmap("<leader>w", ":write<cr>", "Save")
nmap("<leader>q", vim.cmd.qall, "Quit")
nmap("<leader>c", vim.cmd.bdelete, "Quit")
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


-- Telescope Searches
nmap("<leader>sf", function()
        require("telescope.builtin")
            .find_files(require("telescope.themes").get_dropdown())
    end,
    "Find file")

nmap("<leader>se", function()
        require("telescope.builtin")
            .treesitter(require("telescope.themes").get_dropdown())
    end,
    "Treesitter Scope")


nmap("<leader>sh", function()
        require("telescope.builtin")
            .help_tags(require("telescope.themes")
                .get_dropdown())
    end,
    ":help options")

nmap("<leader>sy", function()
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

-- Telescope for git
nmap("<leader>sgf", function()
        require("telescope.builtin")
            .git_files(require("telescope.themes")
                .get_dropdown())
    end,
    "Find file")

nmap("<leader>sgc", function()
        require("telescope.builtin")
            .git_commits(require("telescope.themes")
                .get_dropdown())
    end,
    "Find Commits on project")

nmap("<leader>sgb", function()
        require("telescope.builtin")
            .git_bcommits(require("telescope.themes")
                .get_dropdown())
    end,
    "Find Commits on buffer")

nmap("<leader>sgw", function()
        -- code
        require("telescope.builtin")
            .grep_string(require("telescope.themes")
                .get_dropdown())
    end,
    "Find words in project")

nmap("<leader>uc", function()
        require("telescope.builtin").colorscheme(require("telescope.themes")
            .get_dropdown({
                enable_preview = true,
            }))
    end,
    "Colorscheme"
)


-- Undo Tree
nmap("<leader>uu", vim.cmd.UndotreeToggle, "Undo Tree Structure")


-- File Explorer
nmap("<leader>ue", vim.cmd.NvimTreeToggle, "File Explorer")


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

-- Dap
nmap("<leader>db",
    require("dap").toggle_breakpoint,
    "Toggle Breakpoint"
)

nmap("<leader>dc",
    require("dap").continue,
    "Continue"
)

nmap("<leader>di",
    require("dap").step_into,
    "Step into"
)

nmap("<leader>do",
    require("dap").step_over,
    "Step over"
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
