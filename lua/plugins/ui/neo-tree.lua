-- Neovim-Tree - File Explorer
return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    -- opts are ignored with config
    config = function()
        require("nvim-tree").setup()
        -- vim.g.loaded_netrw = 1
        -- vim.g.loaded_netrwPlugin = 1
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
