-- Neovim-Tree - File Explorer
return {
    "https://github.com/nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "https://github.com/nvim-tree/nvim-web-devicons",
    },
    -- opts are ignored with config
    config = function()
        require("nvim-tree").setup()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
    end,
}
