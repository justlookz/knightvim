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
            "<cmd>TroubleToggle<cr>", "Toggle Trouble" },

        {
            "<leader>td",
            "<cmd>TodoTrouble<cr>",
            "Todos"
        },
        { "<leader>tq", "<cmd>Trouble quickfix<cr>",
            "Quickfix"
        },
        {
            "<leader>tw",
            "<cmd>Trouble workspace_diagnostics<cr>",
            "Workspace Diagnostics"
        },

    },
}
