-- toggler
--- @param path string : The path that is where the lua file is saved
--- @param settings table : Table or saved states
local M = {}
local path = vim.fn.stdpath("config") .. "/lua/user/toggler-settings.lua"
local settings = {}

function M.setup(args)
    if args and args.path then
        path = args.path
    end

    local err, settings = pcall(dofile, path)
    -- for k, v in pairs(settings) do
    --     print(k, tostring(v) .. "\n")
    -- end

    if args and args.settings then
        vim.tbl_deep_extend("force", args.settings, settings)
    end

    if settings ~= nil then
        for k, v in pairs(settings) do
            if k == "colorscheme" then
                vim.cmd.colorscheme(v)
            else
                vim.opt[k] = v
            end
        end -- for
    end     --if settings

    if args and args.on_attach and vim.is_callable(args.on_attach) then
        on_attach()
    end
end -- function

--- Toggle a vim.o[option] setting
--- @param option string : The name of option to toggle
function M.toggle(option)
    if vim.o[option] == true then
        vim.o[option] = false
        settings[option] = false
    else
        vim.o[option] = true
        settings[option] = true
    end
    M.on_toggle()
end

--- Toggle a vim.o[option] setting
--- @param option string : The name of option to toggle
--- @param first_state any : The first state to toggle
--- @param second_state any : The second state to toggle
function M.toggle_with_states(option, first_state, second_state)
    if vim.o[option] == first_state then
        vim.o[option] = second_state
        settings[option] = second_state
    else
        vim.o[option] = first_state
        settings[option] = first_state
    end
    M.on_toggle()
end

function M.set(option, value)
    if option == "colorscheme" then
        vim.cmd.colorscheme(value)
        settings[option] = value
    else
        vim.o[option] = value
        settings[option] = value
    end
end

--- Run on toggler events
function M.on_toggle()
    for k, v in pairs(settings) do
        print(k, tostring(v) .. "\n")
    end

    local f = io.open(path, "w")
    if f == nil and settings == nil then
        vim.api.nvim_notify("Settings are not loaded or file is not loaded on toggler", vim.log.levels.DEBUG)
        return
    end
    f:write("return {\n")
    for k, v in pairs(settings) do
        print(k, tostring(v))
        f:write("    " .. k .. " = " .. tostring(v) .. ",\n")
    end -- for
    f:write("}")
    f:close()
end -- function

return M
