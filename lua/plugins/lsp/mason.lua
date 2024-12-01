return {
    {
        'williamboman/mason.nvim',
        opts = {},
        lazy = false,
    },

    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = {
            'williamboman/mason.nvim',
        },
        config = function()
            require('mason-lspconfig').setup({
                automatic_installation = false,
            })
        end,
        lazy = false,
    }
}
