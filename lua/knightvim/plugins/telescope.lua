-- telescope - for search
return {
    "https://github.com/nvim-telescope/telescope.nvim",
    branch = '0.1.x',
    dependencies = {
        'https://github.com/nvim-lua/plenary.nvim',
        'https://github.com/nvim-telescope/telescope-fzf-native.nvim'
    },
    config = function()
        -- You dont need to set any of these options. These are the default ones. Only
        -- the loading is important

        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local trouble = require("trouble.providers.telescope")

        telescope.setup {
            defaults = {
                mappings = {
                    i = { ["<c-t>"] = trouble.open_with_trouble },
                    n = { ["<c-t>"] = trouble.open_with_trouble },
                },
            },
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
    end
}
