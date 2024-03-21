-- Which Key - Nice menu on leader (DEFAULT SPACE)
return {
    "https://github.com/folke/which-key.nvim",
    opts = {
        register = false,
        spelling = { enabled = false },
        icons = {
            breadcrumb = "$",
            separator = "|",
            group = "#"
        },
        margin = { 0.3, 0, 1, 0 },
        triggers_nowait = {},

    },
    config = function()
        local wk = require("which-key")

        wk.register({
            ["<leader>s"]  = { name = "Search" },
            ["<leader>f"]  = { name = "Split - Join text" },
            ["<leader>sg"] = { name = "Git" },
            ["<leader>st"] = { name = "Type" },
            ["<leader>u"]  = { name = "ui settings" },
            ["<leader>us"] = { name = "Persistent Settings" },
            ["<leader>ug"] = { name = "Git signs" },
            ["<leader>d"]  = { name = "Debug - Dap" },
            ["<leader>L"]  = { name = "Lazy - Package manager" },
            ["<leader>g"]  = { name = "Git actions" },

            ["gt"]         = { name = "Goto type..." },
            ["v]"]         = { name = "Match forward ..." },
            ["v["]         = { name = "Match Backward ..." },
        })
    end,
}
