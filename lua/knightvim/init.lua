kvim = {}
kvim.theme = "rose-pine-moon"
kvim.leader = " "
kvim.plugins = {}
kvim.builtins = {}
kvim.lsp = {}
kvim.lsp.local_include = {}

if (vim.fn.isdirectory( vim.fn.stdpath("config") .. "/lua/user")) == 0 then
    vim.fn.mkdir( vim.fn.stdpath("config") ..  "/lua/user")
end

if (vim.fn.exists( vim.fn.stdpath("config") .. "/lua/user/init.lua")) == 0 then
    local file = io.open( vim.fn.stdpath("config") .. "/lua/user/init.lua", "w")
    file:write(
        "-- this is where you create your own configuration./n-- This is something that I am not gonna change here")
    file:close()
end

require "user"

require("knightvim.options")
require("knightvim.bootstart")
require("knightvim.keymap")
require("knightvim.lsp")
