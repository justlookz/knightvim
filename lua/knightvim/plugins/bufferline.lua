-- Bufferline - Title bars
return {
    'https://github.com/akinsho/bufferline.nvim',
    version = "*",
    dependencies = { 'https://github.com/nvim-tree/nvim-web-devicons' },
    opts = {},
    event = "VeryLazy",
    keys = {

        {
            "H",
            function()
                vim.cmd.BufferLineCyclePrev()
            end,
            desc = "Previous Buffer"
        },
        {
            "L",
            function()
                vim.cmd.BufferLineCycleNext()
            end,
            desc = "Next Buffer"
        },
    }
}
