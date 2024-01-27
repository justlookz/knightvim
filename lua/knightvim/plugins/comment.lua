return {
    {
        "https://github.com/numToStr/Comment.nvim",
        opts = {},
        lazy = false,
    },

    {
        "https://github.com/folke/todo-comments.nvim",
        dependencies = { "https://github.com/nvim-lua/plenary.nvim" },
        event = "VeryLazy",
        opts = {},
    }
}
