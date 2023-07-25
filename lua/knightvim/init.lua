kvim = {}
kvim.theme = "rose-pine-moon"
kvim.leader = " "
kvim.plugins = {}
kvim.builtins = {}
kvim.lsp = {}
kvim.lsp.local_include = {}
kvim.lsp.ghost_text = true


local user_path = vim.fn.stdpath("config") .. "/lua/user"
local user_init_path = vim.fn.stdpath("config") .. "/lua/user/init.lua"
if (vim.fn.isdirectory(user_path)) == 0 then
    vim.fn.mkdir(user_path)
end

if (vim.fn.filereadable(user_init_path)) == 0 then
    local file = io.open(user_init_path, "w")
    file:write(
        "-- this is where you create your own configuration./n-- This is something that I am not gonna change here/n")
    file:close()
end

require "user"

require("knightvim.options")
require("knightvim.bootstart")
require("knightvim.keymap")
require("knightvim.lsp")
