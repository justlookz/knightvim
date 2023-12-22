--lualine - Bottom bar
return {
    'https://github.com/nvim-lualine/lualine.nvim',
    requires = { 'https://github.com/nvim-tree/nvim-web-devicons', opt = true },
    opts = require("knightvim.lualine"),
}
