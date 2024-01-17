return {
    'https://github.com/goolord/alpha-nvim',
    dependencies = { 'https://github.com/nvim-tree/nvim-web-devicons' },
    config = function()
        require 'alpha'.setup(require 'alpha.themes.startify'.config)
    end
}
