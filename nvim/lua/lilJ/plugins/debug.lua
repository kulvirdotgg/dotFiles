-- debug.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)

return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
        "theHamsta/nvim-dap-virtual-text",
        "williamboman/mason.nvim",
        "jay-babu/mason-nvim-dap.nvim",

        -- GO DEBUG
        "leoluz/nvim-dap-go",
    },
    config = function()
        local dap = require "dap"
        local ui = require "dapui"

        require("dapui").setup()
        require("dap-go").setup()

        require("nvim-dap-virtual-text").setup {
            -- This just tries to mitigate the chance that I leak tokens here. Probably won't stop it from happening...
            display_callback = function(variable)
                local name = string.lower(variable.name)
                local value = string.lower(variable.value)
                if name:match "secret" or name:match "api" or value:match "secret" or value:match "api" then
                    return "*****"
                end

                if #variable.value > 15 then
                    return " " .. string.sub(variable.value, 1, 15) .. "... "
                end

                return " " .. variable.value
            end,
        }

        require("mason-nvim-dap").setup {
            automatic_setup = true,

            automatic_installation = true,

            handlers = {},
            ensure_installed = {
                "delve",
            },
        }

        -- Basic debugging keymaps, feel free to change to your liking!
        vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Debug: Start/Continue" })
        vim.keymap.set("n", "<F8>", dap.step_into, { desc = "Debug: Step Into" })
        vim.keymap.set("n", "<F9>", dap.step_over, { desc = "Debug: Step Over" })
        vim.keymap.set("n", "<F10>", dap.step_out, { desc = "Debug: Step Out" })

        vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })

        dap.listeners.before.attach.dapui_config = function()
            ui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            ui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            ui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            ui.close()
        end

        require("dap-go").setup()
    end,
}
