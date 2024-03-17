-- LSP Support
return {
    'https://github.com/neovim/nvim-lspconfig', -- Required
    opts = { inlay_hints = { enabled = true } },
    dependencies = {
        { 'https://github.com/williamboman/mason.nvim' },
        { 'https://github.com/williamboman/mason-lspconfig.nvim' },
        { "folke/neodev.nvim",                                   opts = {} },
    },
    config = function()
        local capabilities = vim.tbl_deep_extend(
            "force",
            vim.lsp.protocol.make_client_capabilities(),
            require("cmp_nvim_lsp").default_capabilities()
        )
        local function lsp_server_setup(lsp_list)
            if lsp_list then
                for _, v in ipairs(lsp_list) do
                    require('lspconfig')[v].setup({
                        capabilities = capabilities,
                    })
                end
            end
        end

        local lsp_server = require(
            "mason-lspconfig"
        ).get_installed_servers()

        lsp_server_setup(lsp_server)
        lsp_server_setup(kvim.lsp.local_include)
    end,

}
