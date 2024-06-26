if vim.version()['minor'] < 10 then
    Tagv = 'v0.0.1'
end

return {
    "NeogitOrg/neogit",
    tag = Tagv,
    dependencies = {
        "nvim-lua/plenary.nvim",  -- required
        "sindrets/diffview.nvim", -- optional - Diff integration

        -- Only one of these is needed, not both.
        "nvim-telescope/telescope.nvim", -- optional
        "ibhagwan/fzf-lua",              -- optional
    },
    config = true,
    cmd = "Neogit",
    keys = {
        {
            "<leader>gw",
            "<cmd>w<cr><cmd>silent !git add %<cr>",
            desc = "Git add and save current file",
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
