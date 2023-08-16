-- toggler
--- @param path string : The path that is where the lua file is saved
local toggler = {}
local path = vim.fn.stdpath("config") .. "/lua/user/toggler-settings.lua"

local settings = dofile(path)

function toggler.setup(args)
    if args then
        if args.settings then
            vim.tbl_extend("force", settings, args.settings)
        end

        if args.path then
            path = args.path
        end
    end
    if vim.fn.glob(path) then
        vim.tbl_extend("force", settings, require("user.toggler-settings"))
    end -- if

    for k, v in pairs(settings) do
        vim.o[k] = v
    end -- for
end

--- Toggle a vim.o[arg] setting
--- @param args string : The name of option to toggle
function toggler.toggle(args)
    vim.o[args] = not vim.o[args]
    settings[args] = vim.o[args]
    toggler.on_toggle()
end

--- Autocommand before exit [ :q | :qa | :qw | :qwa ]
function toggler.on_toggle()
    local f = io.open(path, "w+")
    if f ~= nil then
        f:write("return {\n    ")
        print("save settings ...")
        print(settings.number)
        for k, v in pairs(settings) do
            print(k .. "=" .. tostring(v) .. " is saved")
            f:write(k .. " = " .. tostring(v) .. "\n    ")
        end -- for
        f:write("}")
        f:close()
    end -- if
end     -- function

return toggler
