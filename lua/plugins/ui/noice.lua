-- lazy.nvim
return {
    "https://github.com/folke/noice.nvim",
    opts = {
        messages = { enabled = false },
        notify = { enabled = false },
        lsp = { signature = { enabled = true } },
    },
    dependencies = {
        "https://github.com/MunifTanjim/nui.nvim",
    },
    init = function()
        vim.o.lazyredraw = false
        vim.opt.cmdheight = 0
    end,
    enabled = kvim.core_plugins.alpha
}
