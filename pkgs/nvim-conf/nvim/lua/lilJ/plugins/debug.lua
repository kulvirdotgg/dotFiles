-- debug.lua
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
            -- But I am not a streamer, so I may not want this, or prolly change it in future, but rn its commented
            --
            -- display_callback = function(variable)
            --     local name = string.lower(variable.name)
            --     local value = string.lower(variable.value)
            --     if name:match "secret" or name:match "api" or value:match "secret" or value:match "api" then
            --         return "*****"
            --     end
            --
            --     if #variable.value > 15 then
            --         return " " .. string.sub(variable.value, 1, 15) .. "... "
            --     end
            --
            --     return " " .. variable.value
            -- end,
        }

        require("mason-nvim-dap").setup {
            automatic_setup = true,

            automatic_installation = true,

            handlers = {},
            ensure_installed = {
                "debugpy",
                "delve",
            },
        }

        -- the very common keybind `<leader>db` overlaps with some other keybind
        vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })

        vim.keymap.set("n", "<Space>?", function()
            require("dapui").eval(nil, { enter = true })
        end)

        -- Basic debugging keymaps, feel free to change to your liking!
        vim.keymap.set("n", "<F5>", dap.continue, { desc = "Start/Continue" })
        vim.keymap.set("n", "<F4>", dap.step_into, { desc = "Step Into" })
        vim.keymap.set("n", "<F3>", dap.step_over, { desc = "Step Over" })
        vim.keymap.set("n", "<F2>", dap.step_out, { desc = "Step Out" })
        vim.keymap.set("n", "<F1>", dap.step_back, { desc = "Step Back" })
        vim.keymap.set("n", "<F10>", dap.restart, { desc = "Restart" })

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
