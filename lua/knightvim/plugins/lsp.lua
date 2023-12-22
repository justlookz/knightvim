-- LSP Support
return {
    'https://github.com/neovim/nvim-lspconfig', -- Required
    dependencies = {

        { -- Optional
            'https://github.com/williamboman/mason.nvim',
            build = function()
                require("knightvim.treesitter")
            end,
        },
        { 'https://github.com/williamboman/mason-lspconfig.nvim' }, -- Optional
        -- Autocompletion
        { 'https://github.com/hrsh7th/nvim-cmp' },                  -- Required
        { 'https://github.com/hrsh7th/cmp-nvim-lsp' },              -- Required
        { 'https://github.com/L3MON4D3/LuaSnip' },                  -- Required

        { 'https://github.com/hrsh7th/cmp-buffer' },
        { 'https://github.com/hrsh7th/cmp-path' },
        { 'https://github.com/hrsh7th/cmp-cmdline' },
        { 'https://github.com/hrsh7th/cmp-nvim-lua' },
        { 'https://github.com/hrsh7th/cmp-calc' },

        { 'https://github.com/hrsh7th/cmp-nvim-lsp-document-symbol' },
        { 'https://github.com/saadparwaiz1/cmp_luasnip' },
        -- Dap integration
        { "https://github.com/rcarriga/cmp-dap" },

    },
}
