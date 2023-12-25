-- toggler
local M = {}

--- @global Toggler_globals table : Contains global for toggler
--- @global Toggler_globals.path string : The path that is where the lua file is saved
--- @global settings table : Table or saved states
Toggler_globals = {}
Toggler_globals.settings = {}
Toggler_globals.path = vim.fn.stdpath("config") .. "/lua/user/toggler-settings.lua"

function M.setup(args)
    if args and args.path then
        Toggler_globals.path = args.path
    end

    _, Toggler_globals.settings = pcall(dofile, Toggler_globals.path)

    if type(Toggler_globals.settings) == "string" then
        Toggler_globals.settings = {}
    end

    if args and args.settings then
        vim.tbl_deep_extend("force", args.settings, Toggler_globals.settings)
    end

    if Toggler_globals.settings ~= nil then
        for k, v in pairs(Toggler_globals.settings) do
            if k == "colorscheme" then
                vim.cmd.colorscheme(v)
            else
                vim.opt[k] = v
            end
        end -- for
    end     --if settings

    if args and args.on_attach and vim.is_callable(args.on_attach) then
        args.on_attach()
    end
end -- function

return M
