local M = {}

M.ensure_installed = function (name)
    local err, m = pcall(require, "mason-registry")
    if err == true then
        for _, x in pairs(m.get_installed_package_names()) do
            if x == name then
                return
            end
        end
        if not m.has_package(name) and vim.fn.executable(name) then
            vim.cmd("MasonInstall " .. name)
        end
    end
end

return M
