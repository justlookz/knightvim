kvim = {}
kvim.theme = "nord"
kvim.leader = " "
kvim.plugins = nil
kvim.lsp = {}
kvim.lsp.local_include = nil
kvim.lsp.custom_servers = {}
kvim.lsp.ghost_text = true
kvim.lsp.auto_install = true
kvim.lsp.autoformat = true

-- ensure user folder exsistance
-- and init for user folder
local user_path = vim.fn.stdpath("config") .. "/lua/user"
local user_init_path = vim.fn.stdpath("config") .. "/lua/user/init.lua"

-- ensure user config files
if (vim.fn.filereadable(user_init_path)) == 0 then
    if (vim.fn.isdirectory(user_path)) == 0 then
        vim.fn.mkdir(user_path)
    end

    local file = io.open(user_init_path, "w")
    if file == nil then return end
    file:write(
        "--- this is where you create your own configuration./n\
        --- This is something that I am not gonna change here/n"
    )
    file:close()
end

require "user"

require("knightvim.options")
require("knightvim.bootstrap")
require("knightvim.keymap")
require("knightvim.autocommands")
