-- lazy.nvim
return {
    "https://github.com/folke/noice.nvim",
    event = "VeryLazy",
    opts = {
        messages = { enabled = false },
        notify = { enabled = false },
        lsp = { signature = { enabled = false } },
    },
    dependencies = {
        "https://github.com/MunifTanjim/nui.nvim",
    },
    init = function()
        vim.o.lazyredraw = false
    end,
}
