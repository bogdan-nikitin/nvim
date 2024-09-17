return { 
    "rcarriga/nvim-dap-ui", 
    dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
    config = function() 
        local dap = require('dap')
        local dapui = require("dapui")

        dapui.setup()

        dap.adapters.codelldb = {
          type = 'server',
          port = "${port}",
          executable = {
            -- CHANGE THIS to your path!
            -- command = '/Users/bogdan_nikitin/.config/nvim/daps/codelldb/extension/adapter/codelldb',
            command = vim.fn.stdpath("data") .. (vim.g.is_windows and '/mason/bin/codelldb.cmd' or '/mason/bin/codelldb'),
            args = {"--port", "${port}"},

            -- On windows you may have to uncomment this:
            -- detached = false,
          }
        }

        dap.adapters.lldb = {
            type = 'executable',
            command = '/opt/homebrew/Cellar/llvm/17.0.3/bin/lldb-vscode',
            name = 'lldb',
        }

        dap.adapters.cpp = dap.adapters.codelldb

        dap.configurations.cpp = {
            {
                name = "Launch file",
                type = "codelldb",
                request = "launch",
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
            },
        }

        vim.keymap.set('n', '<F5>', require 'dap'.continue)
        vim.keymap.set('n', '<F9>', require 'dap'.step_into)
        vim.keymap.set('n', '<F10>', require 'dap'.step_over)
        vim.keymap.set('n', '<F12>', require 'dap'.step_out)
        vim.keymap.set('n', '<space>b', require 'dap'.toggle_breakpoint)

        vim.keymap.set('n', '<space>dc', require 'dap'.continue)
        vim.keymap.set('n', '<space>di', require 'dap'.step_into)
        vim.keymap.set('n', '<space>ds', require 'dap'.step_over)
        vim.keymap.set('n', '<space>do', require 'dap'.step_out)
        vim.keymap.set('n', '<space>dbb', require 'dap'.toggle_breakpoint)

        dap.listeners.after.event_initialized["dapui_config"] = function()
          dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
          dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
          dapui.close()
        end
    end
}
