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
            local function no_auto_installed()
                if kvim.lsp.auto_install and kvim.lsp.local_include then
                    return kvim.lsp.local_include
                end
                return false
            end
            require('mason-lspconfig').setup({
                automatic_installation = {
                    exclude = no_auto_installed(),
                    handlers = {},
                },
            })
        end,
        lazy = false,
    }
}
