local core = {

    -- telescope - for search
    {
        "https://github.com/nvim-telescope/telescope.nvim",
        branch = '0.1.x',
        dependencies = {
            'https://github.com/nvim-lua/plenary.nvim',
            'https://github.com/nvim-telescope/telescope-fzf-native.nvim'
        },
        config = function()
            require("knightvim.telescope")
        end
    },


    -- treesitter - for highlighting
    {
        'https://github.com/nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    },


    -- LSP Support
    {
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
    },

    -- Commentary
    { "https://github.com/tpope/vim-commentary" },


    -- Dap with Mason-Dap-Config
    {
        "https://github.com/jay-babu/mason-nvim-dap.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
        }
    },

    --Dap lsp integration
    {
        "https://github.com/nvim-telescope/telescope-dap.nvim"
    },

    {
        "https://github.com/rcarriga/nvim-dap-ui",
        requires = { "mfussenegger/nvim-dap" },
        opts = {}
    },

    -- friendly-snippets - Premade snippets
    { "https://github.com/rafamadriz/friendly-snippets" },


    -- Theme Rose pine - Theme
    {
        'https://github.com/rose-pine/neovim',
        name = 'rose-pine'
    },

    --Embark - Theme
    {
        'https://github.com/embark-theme/vim',
        name = 'embark'
    },

    -- Starry Collection - Themes
    { 'https://github.com/ray-x/starry.nvim' },

    -- Tokyo-night - Theme
    { "https://github.com/folke/tokyonight.nvim", },

    -- Nordic - Theme
    { 'https://github.com/andersevenrud/nordic.nvim' },


    --lualine - Bottom bar
    {
        'https://github.com/nvim-lualine/lualine.nvim',
        requires = { 'https://github.com/nvim-tree/nvim-web-devicons', opt = true },
        opts = require("knightvim.lualine"),
    },


    --{ "lukas-reineke/lsp-format.nvim" },


    -- Notifier -- Nice notofication
    {
        "https://github.com/vigoux/notifier.nvim",
        opts = {},
    },


    -- Bufferline - Title bars
    {
        'https://github.com/akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'https://github.com/nvim-tree/nvim-web-devicons',
        opts = {},
    },


    -- Auto close bracket
    {
        'https://github.com/windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },

    -- Undo Tree - History like undo
    { 'https://github.com/mbbill/undotree' },

    -- Which Key - Nice menu on leader (DEFAULT SPACE)
    {
        "https://github.com/folke/which-key.nvim",
        event = "VeryLazy",
        opts = {},
    },

    -- Fzf
    { 'https://github.com/nvim-telescope/telescope-fzf-native.nvim', build = 'make' },


    -- todo-comments - for comments highlightin
    {
        "https://github.com/folke/todo-comments.nvim",
        dependencies = { "https://github.com/nvim-lua/plenary.nvim" },
        opts = {},
    },


    -- Neovim-Tree - File Explorer
    {
        "https://github.com/nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "https://github.com/nvim-tree/nvim-web-devicons",
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
        dependencies = { "https://github.com/nvim-tree/nvim-web-devicons" },
        opts = {},
    },


    -- Colorizer - For colors
    {
        'https://github.com/NvChad/nvim-colorizer.lua',
        opts = {}
    },


    -- nvim-treesitter-context - for persistent headers
    {
        "https://github.com/nvim-treesitter/nvim-treesitter-context",
        opts = {}
    },

    --git Fugitive
    { "https://github.com/tpope/vim-fugitive" },

    -- Gitsign - Github integration
    {
        "lewis6991/gitsigns.nvim",
        opts = require("knightvim.gitsign")
    },

}

vim.tbl_deep_extend("force", core, kvim.plugins)
return core
