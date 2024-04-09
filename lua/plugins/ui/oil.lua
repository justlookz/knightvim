return {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        {
            "<leader>o",
            "<cmd>Oil<cr>",
            desc = "Oil File manager",
        }
    }
}
