-- toggler
--- @param path string : The path that is where the lua file is saved
local toggler = {}
local path = vim.fn.stdpath("config") .. "/lua/user/toggler-settings.lua"
local settings = {}

function toggler.setup(args)
    if args and args.path then
        path = args.path
    end

    local _, settings = pcall(dofile, path)
    if args and args.settings then
        vim.tbl_extend("keep", settings, args.settings)
    end

    if settings ~= nil then
        for k, v in pairs(settings) do
            vim.opt[k] = v
        end -- for
    end     --if settings

    if args and args.on_attach and vim.is_callable(args.on_attach) then
        on_attach()
    end
end -- function

--- Toggle a vim.o[arg] setting
--- @param args string : The name of option to toggle
function toggler.toggle(args)
    if vim.o[args] == true then
        vim.o[args] = false
        settings[args] = false
    else
        vim.o[args] = true
        settings[args] = true
    end
    toggler.on_toggle()
end

--- Run on toggler events
function toggler.on_toggle()
    local f = io.open(path, "w")
    if f ~= nil and settings ~= nil then
        f:write("return {\n")
        for k, v in pairs(settings) do
            f:write("    " .. k .. " = " .. tostring(v) .. ",\n")
        end -- for
        f:write("}")
        f:close()
    end -- if
end     -- function

return toggler
