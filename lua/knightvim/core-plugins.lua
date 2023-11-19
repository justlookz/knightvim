local core = {

    -- telescope - for search
    {
        "nvim-telescope/telescope.nvim",
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-fzf-native.nvim'
        },
        config = function()
            require("knightvim.telescope")
        end
    },


    -- treesitter - for highlighting
    {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    },


    -- LSP Support
    {
        'neovim/nvim-lspconfig', -- Required
        dependencies = {

            { -- Optional
                'williamboman/mason.nvim',
                build = function()
                    require("knightvim.treesitter")
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
            -- Dap integration
            { "rcarriga/cmp-dap" },

        },
    },


    -- Dap with Mason-Dap-Config
    {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
        }
    },

    --Dap lsp integration
    {
        "nvim-telescope/telescope-dap.nvim"
    },

    {
        "rcarriga/nvim-dap-ui",
        requires = { "mfussenegger/nvim-dap" },
        opts = {}
    },

    -- friendly-snippets - Premade snippets
    { "rafamadriz/friendly-snippets" },


    -- Theme Rose pine - Theme
    {
        'rose-pine/neovim',
        name = 'rose-pine'
    },

    --Embark - Theme
    {
        'embark-theme/vim',
        name = 'embark'
    },

    -- Starry Collection - Themes
    { 'ray-x/starry.nvim' },

    -- Tokyo-night - Theme
    { "folke/tokyonight.nvim", },

    -- Nordic - Theme
    { 'andersevenrud/nordic.nvim' },


    --lualine - Bottom bar
    {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
        opts = require("knightvim.lualine"),
    },


    --{ "lukas-reineke/lsp-format.nvim" },


    -- Notifier -- Nice notofication
    {
        "vigoux/notifier.nvim",
        opts = {},
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
        -- opts are ignored with config
        config = function()
            require("nvim-tree").setup()
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1
        end,
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


    -- nvim-treesitter-context - for persistent headers
    {
        "nvim-treesitter/nvim-treesitter-context",
        opts = {}
    },


    -- Gitsign - Github integration
    {
        "lewis6991/gitsigns.nvim",
        opts = require("knightvim.gitsign")
    },

}

vim.tbl_deep_extend("force", core, kvim.plugins)
return core
