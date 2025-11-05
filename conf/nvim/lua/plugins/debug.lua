return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            {
                "mason-org/mason.nvim",
                config = function()
                    require("mason").setup()
                end,
            },
            {
                "jay-babu/mason-nvim-dap.nvim",
                config = function()
                    require("mason-nvim-dap").setup({
                        ensure_installed = { "netcoredbg" },
                        handlers = {},
                    })
                end,
            },
            {
                "rcarriga/nvim-dap-ui",
                dependencies = {
                    "nvim-neotest/nvim-nio",
                },
                config = function()
                    local dapui = require("dapui")
                    dapui.setup()
                    local dap = require("dap")
                    dap.listeners.after.event_initialized["dapui_config"] = function()
                        dapui.open()
                    end
                    dap.listeners.before.event_terminated["dapui_config"] = function()
                        dapui.close()
                    end
                    dap.listeners.before.event_exited["dapui_config"] = function()
                        dapui.close()
                    end
                end,
            },
        },
        config = function()
            local dap = require("dap")

            -- The key is the filetype, 'cs' for C#
            dap.configurations.cs = {
                {
                    type = "coreclr",
                    name = "launch - netcoredbg",
                    request = "launch",
                    program = function()
                        -- This prompts you to enter the path to the DLL every time
                        return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/", "file")
                    end,
                },
            }
        end,
    },
}
