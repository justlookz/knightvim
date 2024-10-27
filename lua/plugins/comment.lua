return {
    {
        "numToStr/Comment.nvim",
        opts = {},
    },

    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
        keymap = {
            "]t", function()
                require("todo-comments").jump_next()
            end,
            { desc = "Next todo comment" },

            { "[t", function()
                require("todo-comments").jump_prev()
            end,
            { desc = "Previous todo comment" },
            }
        }
    }
}
