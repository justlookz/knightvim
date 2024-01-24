-- Dap with Mason-Dap-Config
return {
    "https://github.com/jay-babu/mason-nvim-dap.nvim",
    dependencies = {
        "https://github.com/williamboman/mason.nvim",
        "https://github.com/mfussenegger/nvim-dap",
    },
    config = function()
        require('mason-nvim-dap').setup({
            ensure_installed = { 'stylua', 'cppdbg' },
            handlers = {},
        })
    end
}
