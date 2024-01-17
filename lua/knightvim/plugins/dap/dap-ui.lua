return {
    "https://github.com/rcarriga/nvim-dap-ui",
    dependencies = {
        "https://github.com/mfussenegger/nvim-dap",
    },
    opts = {},
    lazy = true,
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
