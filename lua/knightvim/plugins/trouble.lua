-- Trouble - Mostly for error handling and references
return {
    "folke/trouble.nvim",
    dependencies = { "https://github.com/nvim-tree/nvim-web-devicons" },
    opts = {},
    lazy = true,
    keys = {

        -- Trouble Debug menu
        {
            "<leader>tt",
            function()
                require("trouble").toggle()
            end,
            desc = "Toggle Trouble"
        },

        {
            "<leader>td",
            "<cmd>TodoTrouble<cr>",
            desc = "Todos"
        },
        {
            "<leader>tq",
            function()
                require("trouble").toggle("quickfix")
            end,
            desc = "Quickfix"
        },

        {
            "<leader>tw",
            function()
                require("trouble").toggle("workspace_diagnostics")
            end,
            desc = "Workspace Diagnostics"
        },

        {
            "<leader>tn",
            function()
                require("trouble").next({
                    skip_groups = true,
                    jump = true
                })
            end,
            desc = "next"
        },

        {
            "<leader>tp",
            function()
                require("trouble").previous({
                    skip_groups = true,
                    jump = true
                })
            end,
            desc = "previous"
        },

        {
            "<leader>tr",
            function()
                require("trouble").toggle("lsp_references")
            end,
            desc = "Lsp references"
        },

    },
}
