return {

    "https://github.com/mfussenegger/nvim-dap",
    lazy = true,
    init = function()
        local dap = require("dap")
        dap.adapters.gdb = {
            type = "executable",
            command = "gdb",
            args = { "-i", "dap" }
        }

        local gdb = {

            name = "Launch with gdb",
            type = "gdb",
            request = "launch",
            program = function()
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            cwd = "${workspaceFolder}",
        }

        dap.adapters.lldb = {
            type = 'executable',
            command = 'lldb-vscode',
            name = 'lldb'
        }

        dap.adapters.delve = {
            type = 'server',
            port = '${port}',
            executable = {
                command = 'dlv',
                args = { 'dap', '-l', '127.0.0.1:${port}' },
            }
        }

        dap.configurations.go = {
            {
                type = "delve",
                name = "Debug",
                request = "launch",
                program = "${file}"
            },
            {
                type = "delve",
                name = "Debug test", -- configuration for debugging test files
                request = "launch",
                mode = "test",
                program = "${file}"
            },

            {
                type = "delve",
                name = "Debug test (go.mod)",
                request = "launch",
                mode = "test",
                program = "./${relativeFileDirname}"
            }
        }

        local lldb =
        {
            name = 'Launch with lldb $PATH',
            type = 'lldb',
            request = 'launch',
            program = function()
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            cwd = '${workspaceFolder}',
            stopOnEntry = false,
            args = {},
        }


        dap.configurations.cpp = { lldb, gdb }
        dap.configurations.c = { lldb, gdb }
        dap.configurations.rust = { lldb, gdb }
    end,
    keys = {
        -- Dap
        { "<F8>", "<leader>db" },

        {
            "<leader>db",
            function()
                require("dap").toggle_breakpoint()
            end,
            desc = "Toggle Breakpoint[F8]"
        },

        { "<F5>", "<leader>dc" },

        {
            "<leader>dc",
            function()
                require("dap").continue()
            end,
            desc = "Continue[F5]"
        },

        { "<F6>", "<leader>di" },

        {
            "<leader>di",
            function()
                require("dap").step_into()
            end,
            desc = "Step into[F6]"
        },

        { "<F7>", "<leader>do" },

        {
            "<leader>do",
            function()
                require("dap").step_over()
            end,
            desc = "Step over[F7]"
        },

        { "<F9>", "<leader>du" },

        {
            "<leader>du",
            function()
                require("dap").step_out()
            end,
            desc = "Step out[F9]"
        },

    }

}
