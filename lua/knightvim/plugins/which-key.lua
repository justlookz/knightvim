-- Which Key - Nice menu on leader (DEFAULT SPACE)
return {
    "https://github.com/folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
    config = function()
        local wk = require("which-key")

        wk.register({
            ["<leader>s"]  = "Search",
            ["<leader>f"]  = "Split - Join text",
            ["<leader>sg"] = "Git",
            ["<leader>st"] = "Type",
            ["<leader>u"]  = "ui settings",
            ["<leader>us"] = "Persistent Settings",
            ["<leader>ug"] = "Git signs",
            ["<leader>d"]  = "Debug - Dap",
            ["<leader>L"]  = "Lazy - Package manager",
            ["<leader>g"]  = "Git actions",

            ["gt"]         = "Goto type...",
            ["v]"]         = "Match forward ...",
            ["v["]         = "Match Backward ...",
        })
    end,
}
