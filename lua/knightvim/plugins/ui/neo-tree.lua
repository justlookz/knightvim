-- Neovim-Tree - File Explorer
return {
    "https://github.com/nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    event = "VeryLazy",
    dependencies = {
        "https://github.com/nvim-tree/nvim-web-devicons",
    },
    -- opts are ignored with config
    config = function()
        require("nvim-tree").setup()
    end,
    keys = {
        -- File Explorer
        {
            "<leader>ue",
            vim.cmd.NvimTreeToggle,
            desc = "File Explorer",
            mode = "n",
        },
    },
}
