return {
    'https://github.com/williamboman/mason-lspconfig.nvim',
    dependencies = {
        'https://github.com/williamboman/mason.nvim',
    },
    event = "VeryLazy",
    configs = function()
        local function no_auto_installed()
            if kvim.lsp.auto_install then
                return kvim.lsp.local_include
            end
            return false
        end

        require('mason-lspconfig').setup({
            automatic_installation = {
                exclude = no_auto_installed(),
            },
        })
        pcall(vim.cmd, 'MasonUpdate')
    end
}
