return {
    {
        'https://github.com/williamboman/mason.nvim',
        opts = {},
        lazy = false,
    },

    {
        'https://github.com/williamboman/mason-lspconfig.nvim',
        dependencies = {
            'https://github.com/williamboman/mason.nvim',
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
