return {

    "https://github.com/mfussenegger/nvim-dap",
    lazy = true,
    keys = {
        -- Dap
        { "<F8>", "<leader>db" },

        {
            "<leader>db",
            function()
                require("dap").toggle_breakpoint()
            end,
            desc = "Toggle Breakpoint[F8]"
        },

        { "<F5>", "<leader>dc" },

        {
            "<leader>dc",
            function()
                require("dap").continue()
            end,
            desc = "Continue[F5]"
        },

        { "<F6>", "<leader>di" },

        {
            "<leader>di",
            function()
                require("dap").step_into()
            end,
            desc = "Step into[F6]"
        },

        { "<F7>", "<leader>do" },

        {
            "<leader>do",
            function()
                require("dap").step_over()
            end,
            desc = "Step over[F7]"
        },

        { "<F9>", "<leader>du" },

        {
            "<leader>du",
            function()
                require("dap").step_out()
            end,
            desc = "Step out[F9]"
        },

    }

}
