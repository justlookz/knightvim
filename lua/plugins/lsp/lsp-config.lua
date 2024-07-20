-- LSP Support
return {
    'neovim/nvim-lspconfig', -- Required
    opts = {},
    dependencies = {
        { 'williamboman/mason.nvim' },
        { 'williamboman/mason-lspconfig.nvim' },
        {
            "folke/neodev.nvim",
            opts = {},
        },
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
                    if not kvim.lsp.options[v] then
                        require('lspconfig')[v].setup({
                            capabilities = capabilities,
                        })
                    else
                        local tmp = { cababilities = capabilities }
                        for k, v2 in pairs(kvim.lsp.options[v]) do
                            tmp[k] = v2
                        end
                        require('lspconfig')[v].setup(tmp)
                    end
                end
            end
        end

        local lsp_server = require(
            "mason-lspconfig"
        ).get_installed_servers()

        vim.list_extend(lsp_server, kvim.lsp.local_include)

        lsp_server_setup(lsp_server)
    end,

}
