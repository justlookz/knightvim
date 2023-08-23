local M = {}
--- Toggle a vim.o[option] setting
--- @param option string : The name of option to toggle
function M.toggle(option)
    if vim.o[option] == true then
        vim.o[option] = false
        Toggler_globals.settings[option] = false
    else
        vim.o[option] = true
        Toggler_globals.settings[option] = true
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
        Toggler_globals.settings[option] = second_state
    else
        vim.o[option] = first_state
        Toggler_globals.settings[option] = first_state
    end
    M.on_toggle()
end

function M.set(option, value)
    if option == "colorscheme" then
        vim.cmd.colorscheme(value)
        Toggler_globals.settings[option] = value
    else
        vim.o[option] = value
        Toggler_globals.settings[option] = value
    end
    M.on_toggle()
end

--- Run on toggler events
function M.on_toggle()
    -- for k, v in pairs(Toggler_globals.settings) do
    --     print(k, tostring(v) .. "\n")
    -- end

    local f = io.open(Toggler_globals.path, "w")
    if f == nil or Toggler_globals.settings == nil then
        vim.api.nvim_notify("Settings are not loaded or file is not loaded on toggler", vim.log.levels.DEBUG)
        return
    end
    f:write("return {\n")
    for k, v in pairs(Toggler_globals.settings) do
        if type(v) == "string" then
            f:write("    " .. k .. " = '" .. tostring(v) .. "',\n")
        else
            f:write("    " .. k .. " = " .. tostring(v) .. ",\n")
        end
    end -- for
    f:write("}")
    f:close()
end -- function

return M
