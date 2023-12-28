-- LSP Support
return {
    'https://github.com/neovim/nvim-lspconfig', -- Required
    event = "VeryLazy",
    dependencies = {

        { -- Optional
            'https://github.com/williamboman/mason.nvim',
        },
        { 'https://github.com/williamboman/mason-lspconfig.nvim' }, -- Optional
        -- Autocompletion
            },
    config = function()
        local function lsp_server_setup(lsp_list)
            if lsp_list ~= nil then
                for _, v in ipairs(lsp_list) do
                    require('lspconfig')[v].setup({
                        capabilities = require('cmp_nvim_lsp')
                            .default_capabilities(),
                    })
                end
            end
        end


        local lsp_server = require("mason-lspconfig").get_installed_servers()

        lsp_server_setup(lsp_server)
        lsp_server_setup(kvim.lsp.local_include)
    end,

}
