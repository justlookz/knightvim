return {
    'https://github.com/chipsenkbeil/distant.nvim',
    branch = 'v0.3',
    event = "VeryLazy",
    config = function()
        require('distant'):setup()
    end
}
