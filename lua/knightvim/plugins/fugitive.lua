--git Fugitive
return {
    "https://github.com/tpope/vim-fugitive",
    lazy = false,
    keys = {
        {
            "<leader>gw",
            "<cmd>Gwrite<cr>",
            desc = "Git add current file"
        },
        {
            "<leader>gc",
            "<cmd>Git commit<cr>",
            desc = "Git commit on current branch"
        },
        {
            "<leader>gp",
            "<cmd>silent Git push<cr>",
            desc = "Git push on current origin"
        },
    },
}
