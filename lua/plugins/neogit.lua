return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",  -- required
        "sindrets/diffview.nvim", -- optional - Diff integration

        -- Only one of these is needed, not both.
        "nvim-telescope/telescope.nvim", -- optional
        "ibhagwan/fzf-lua",              -- optional
    },
    config = true,
    enabled = kvim.core_plugins.neogit,
    cmd = "Neogit",
    keys = {
        {
            "<leader>gw",
            "<cmd>w<cr><cmd>silent !git add %<cr>",
            desc = "Git add current file",
        },
        {
            "<leader>gc",
            "<cmd>Neogit commit<cr>",
            desc = "Git commit on current branch"
        },

        {
            "<leader>gg",
            "<cmd>Neogit<cr>",
            desc = "Neogit window"
        },
        {
            "<leader>gf",
            "<cmd>Neogit kind=floating<cr>",
            desc = "Float neogit window"
        },
    }
}
