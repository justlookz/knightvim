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
            "<cmd>w<cr><cmd>!git add %<cr><cr>",
            desc = "Git add current file",
            silent = true,
        },
        {
            "<leader>gc",
            "<cmd>Neogit commit<cr>",
            desc = "Git commit on current branch"
        },
        {
            "<leader>gp",
            "<cmd>!git push<cr><cr>",
            desc = "Git push on current origin"
        },
    }
}
