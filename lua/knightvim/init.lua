kvim = {}
kvim.theme = "rose-pine-moon"
kvim.leader = " "
kvim.plugins = {}
kvim.builtins = {}
kvim.lsp = {}
kvim.lsp.local_include = {}

if vim.fn.isdirectory("user") == 0 then
    vim.fn.mkdir("user")
end

if vim.fn.exists("user.init.lua") == 0 then
    local file = io.open("user/init.lua", "w")
    file:write(
        "-- this is where you create your own configuration./n-- This is something that I am not gonna change here")
    file:close()
end

require "user"

require("knightvim.options")
require("knightvim.bootstart")
require("knightvim.keymap")
require("knightvim.lsp")
