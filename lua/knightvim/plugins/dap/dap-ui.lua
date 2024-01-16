return {
    "https://github.com/rcarriga/nvim-dap-ui",
    requires = { "https://github.com/rcarriga/mfussenegger/nvim-dap" },
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
