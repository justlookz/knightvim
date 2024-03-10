local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
--- if path none existed clone lazy to that path
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

--- This is used to load lazy from pligins folder
require("lazy").setup({
    { import = "plugins" },
    { import = "plugins.colorscheme" },
    { import = "plugins.lsp" },
    { import = "plugins.dap" },
    { import = "plugins.ui" },
})

require("toggler").setup()

vim.cmd.colorscheme(kvim.theme)
