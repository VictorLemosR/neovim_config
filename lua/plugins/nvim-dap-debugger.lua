return{
    'mfussenegger/nvim-dap',
    dependencies = {
        'mfussenegger/nvim-dap-python',
        'rcarriga/nvim-dap-ui',
        "nvim-neotest/nvim-nio",
    },
    priority = 10,

    config = function ()
        local dap = require('dap')
        --local path = "C:/.virtualenvs/debugpy/Scripts/python.exe"
        local dap_python = require('dap-python')
        local paths = require('victor.paths')
        dap_python.setup(paths.python_file)


        local remaps_plugins = require("victor.hotkeys_plugins")
        local KEYS = remaps_plugins.debugger
        -- require('dap-python').test_method()
        vim.keymap.set("n", KEYS.run, dap.continue)
        vim.keymap.set("n", KEYS.toggle_breakpoint, dap.toggle_breakpoint)
        vim.keymap.set("n", KEYS.step_over, dap.step_over)
        vim.keymap.set("n", KEYS.step_into, dap.step_into)
        vim.keymap.set("n", KEYS.step_out, dap.step_out)

        vim.keymap.set("n", KEYS.test_class, dap_python.test_class)
        vim.keymap.set("n", KEYS.test_method, dap_python.test_method)


        local dapui = require("dapui")
        dapui.setup({
             mappings = {
                 add = '<leader>a'
             }
        })
        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end
    end
}
