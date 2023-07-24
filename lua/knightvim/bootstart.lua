local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
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

require("lazy").setup(require "knightvim.core-plugins")


require("nvim-tree").setup {}

vim.cmd.colorscheme(kvim.theme)
require('lualine').setup("knightvim.lualine")

require("bufferline").setup {}
require("knightvim.telescope")
require "knightvim.telescope"
require "knightvim.treesitter"
