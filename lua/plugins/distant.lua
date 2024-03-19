return {
    'https://github.com/chipsenkbeil/distant.nvim',
    branch = 'v0.3',
    cmd = "DistantConnect",
    config = function()
        require('distant'):setup()
    end
}
