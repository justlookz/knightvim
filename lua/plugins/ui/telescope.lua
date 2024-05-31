-- telescope - for search
return {
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
    },

    {
        "nvim-telescope/telescope.nvim",
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-fzf-native.nvim',
            'nvim-telescope/telescope-ui-select.nvim',
        },
        lazy = true,
        config = function()
            -- You dont need to set any of these options. These are the default ones. Only
            -- the loading is important

            local telescope = require("telescope")
            --local actions = require("telescope.actions")

            telescope.setup {
                extensions = {
                    fzf = {
                        fuzzy                   = true, -- false will only do exact matching
                        override_generic_sorter = true, -- override the generic sorter
                        override_file_sorter    = true, -- override the file sorter
                        case_mode               = "smart_case",
                        -- or "ignore_case" or "respect_case"
                        -- the default case_mode is "smart_case"
                    }
                }
            }
            -- To get fzf loaded and working with telescope, you need to call
            -- load_extension, somewhere after setup function:
            telescope.load_extension('fzf')
            telescope.load_extension('dap')

            require("telescope").load_extension("ui-select")
        end,
        keys = {
            -- Telescope for git
            {
                "<leader>sgf",
                function()
                    require("telescope.builtin")
                        .git_files(require("telescope.themes")
                            .get_dropdown())
                end,
                desc = "Find file",
                mode = "n",
            },

            {
                "<leader>sgc",
                function()
                    require("telescope.builtin")
                        .git_commits(require("telescope.themes")
                            .get_dropdown())
                end,
                desc = "Find Commits on project",
                mode = "n",
            },

            {
                "<leader>sgb",
                function()
                    require("telescope.builtin")
                        .git_bcommits(require("telescope.themes")
                            .get_dropdown())
                end,
                desc = "Find Commits on buffer",
                mode = "n",
            },

            {
                "<leader>sgw",
                function()
                    -- code
                    require("telescope.builtin")
                        .grep_string(require("telescope.themes")
                            .get_dropdown())
                end,
                desc = "Find words in project",
                mode = "n",
            },

            {
                "<leader>uc",
                function()
                    require("telescope.builtin").colorscheme(require("telescope.themes")
                        .get_dropdown({
                            enable_preview = true,
                        }))
                end,
                desc = "Colorscheme list",
                mode = "n",
            },
            -- Telescope Searches
            {
                "<leader>sf",
                function()
                    require("telescope.builtin")
                        .find_files()
                end,
                desc = "Find file",
                mode = "n",
            },

            {
                "<leader><leader>",
                function()
                    require("telescope.builtin")
                        .buffers()
                end,
                desc = "Find file",
                mode = "n",
            },

            {
                "<leader>se",
                function()
                    require("telescope.builtin")
                        .treesitter()
                end,
                desc = "Treesitter Scope",
                mode = "n",
            },


            {
                "<leader>sh",
                function()
                    require("telescope.builtin")
                        .help_tags(require("telescope.themes")
                            .get_dropdown())
                end,
                desc = ":help options",
                mode = "n",
            },

            {
                "<leader>sy",
                function()
                    require("telescope.builtin")
                        .filetypes(require("telescope.themes")
                            .get_dropdown())
                end
                ,
                desc = "filetypes",
                mode = "n",
            },

            {
                "<leader>sw",
                function()
                    require("telescope.builtin")
                        .live_grep()
                end,
                desc = "Find text",
                mode = "n",
            },

        },
    }
}
