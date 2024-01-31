return {
    "mfussenegger/nvim-lint",

    event = {
        "BufReadPre",
        "BufNewFile",
    },

    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            typescript = { "eslint_d" },
            javascript = { "eslint_d" },
            javascriptreact = { "eslint" },
            typescriptreact = { "eslint" },
            python = { "flake8" },
        }

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            callback = function()
                lint.try_lint()
            end,
        })

        vim.api.nvim_buf_create_user_command(0, "Lint", function()
            lint.try_lint()
        end, {})
    end,
}
