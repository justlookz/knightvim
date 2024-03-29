return {
    "https://github.com/rcarriga/nvim-dap-ui",
    dependencies = {
        "https://github.com/mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"
    },
    opts = {
        layouts = { {
            elements = { {
                id = "scopes",
                size = 0.25
            }, {
                id = "breakpoints",
                size = 0.25
            }, {
                id = "stacks",
                size = 0.25
            }, {
                id = "watches",
                size = 0.25
            } },
            position = "right",
            size = 40
        }, {
            elements = { {
                id = "repl",
                size = 0.5
            }, {
                id = "console",
                size = 0.5
            } },
            position = "bottom",
            size = 10
        } },

    },

    keys = {
        {
            "<leader>ud",
            function()
                require('dapui').toggle()
            end,
            desc = "Dap Ui toggle"
        },
    }
}
