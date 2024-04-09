return {

    "https://github.com/nordtheme/vim",
    {
        'https://github.com/embark-theme/vim',
        name = 'embark'
    },
    "https://github.com/EdenEast/nightfox.nvim", {
    'https://github.com/rose-pine/neovim',
    name = 'rose-pine',
},
    "https://github.com/folke/tokyonight.nvim",
    "https://github.com/LunarVim/lunar.nvim",
    {
        "loctvl842/monokai-pro.nvim",
        config = function()
            require("monokai-pro").setup()
        end
    }
}
