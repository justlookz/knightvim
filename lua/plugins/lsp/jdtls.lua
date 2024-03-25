return {
    'mfussenegger/nvim-jdtls',
    ft = "java",
    lazy = true,
    config = function()
        local jdtls = require "jdtls"
        local jdtls_exec = vim.fn.stdpath("data") .. "/mason/bin/jdtls"
        local jdtls_debug = vim.fn.stdpath("data") .. "/mason/bin/java-debug-adapter"
        local jdtls_test = vim.fn.stdpath("data") .. "/mason/bin/java-test"

        local config = {
            cmd = { jdtls_exec },
            root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
        }

        jdtls.start_or_attach(config)
    end
}
