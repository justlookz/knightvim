return {
    "https://github.com/rcarriga/nvim-dap-ui",
    requires = { "https://github.com/rcarriga/mfussenegger/nvim-dap" },
    opts = {},
    lazy = true,
    keys = {
        {
            "<leader>ud",
            "<cmd>lua require('dapui').toggle()<cr>",
            desc = "Dap Ui toggle"
        },
    }
}
