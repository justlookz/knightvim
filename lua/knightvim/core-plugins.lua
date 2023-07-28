local core = {

    -- telescope - for search
    {
        "nvim-telescope/telescope.nvim",
        branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    -- treesitter - for highlighting
    {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {                            -- Optional
                'williamboman/mason.nvim',
                build = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },                  -- Required
            { 'hrsh7th/cmp-nvim-lsp' },              -- Required
            { 'L3MON4D3/LuaSnip' },                  -- Required

            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-cmdline' },
            { 'hrsh7th/cmp-nvim-lua' },
            { 'hrsh7th/cmp-calc' },

            { 'hrsh7th/cmp-nvim-lsp-document-symbol' },
            { 'saadparwaiz1/cmp_luasnip' },

        },
    },

    -- Premade snippets
    { "rafamadriz/friendly-snippets" },

    -- Theme Rose pine
    { 'rose-pine/neovim',            name = 'rose-pine' },
    {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    },

    { "lukas-reineke/lsp-format.nvim" },
    {
        "p00f/clangd_extensions.nvim",
        ft = { "c", "cpp", "cuda", },
        version = "*",
        lazy = true,

    },

    -- Bufferline - Title bars
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        opts = {},
    },

    -- Auto close bracket
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },

    -- Undo Tree - History like undo
    { 'mbbill/undotree' },

    -- Which Key - Nice menu on leader (DEFAULT SPACE)
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {},
    },

    -- Fzf
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

    -- todo-comments - for comments highlightin
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
    },

    -- Neovim-Tree - File Explorer
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1
        end,
        opts = {},
    },

    -- Trouble - Mostly for error handling and references
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {},
    },

    -- Colorizer - For colors
    {
        'NvChad/nvim-colorizer.lua',
        opts = {}
    },

}

for k, v in ipairs(kvim.plugins) do
    core[k] = v
end

return core
