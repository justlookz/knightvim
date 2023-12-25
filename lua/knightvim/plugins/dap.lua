return {

    "mfussenegger/nvim-dap",
    lazy = true,
    keys = {
        -- Dap
        { "<F8>", "<leader>db" },

        {
            "<leader>db",
            "<cmd>DapToggleBreakpoint<cr>",
            desc = "Toggle Breakpoint[F8]"
        },

        { "<F5>", "<leader>dc" },

        {
            "<leader>dc",
            "<cmd>DapContinue<cr>",
            desc = "Continue[F5]"
        },

        { "<F6>", "<leader>di" },

        {
            "<leader>di",
            "<cmd>DapStepInto<cr>",
            desc = "Step into[F6]"
        },

        { "<F7>", "<leader>do" },

        {
            "<leader>do",
            "<cmd>DapStepOver<cr>",
            desc = "Step over[F7]"
        },
    }

}
