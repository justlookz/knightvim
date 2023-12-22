-- telescope - for search
return {
    "https://github.com/nvim-telescope/telescope.nvim",
    branch = '0.1.x',
    dependencies = {
        'https://github.com/nvim-lua/plenary.nvim',
        'https://github.com/nvim-telescope/telescope-fzf-native.nvim'
    },
    config = function()
        require("knightvim.telescope")
    end
}
