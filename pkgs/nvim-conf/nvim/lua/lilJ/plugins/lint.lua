return {
    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local lint = require "lint"

            lint.linters_by_ft = {
                python = { "ruff", "mypy" },
                dockerfile = { "hadolint" },
                json = { "jsonlint" },
                markdown = { "vale" },
            }

            -- To allow other plugins to add linters to require('lint').linters_by_ft,
            -- instead set linters_by_ft like this:
            -- lint.linters_by_ft = lint.linters_by_ft or {}
            -- lint.linters_by_ft['markdown'] = { 'markdownlint' }
            --
            -- However, note that this will enable a set of default linters,
            -- which will cause errors unless these tools are available:
            -- {
            --   dockerfile = { "hadolint" },
            --   json = { "jsonlint" },
            --   markdown = { "vale" },
            --   text = { "vale" }
            -- }
            --
            -- You can disable the default linters by setting their filetypes to nil:
            -- lint.linters_by_ft['dockerfile'] = nil
            -- lint.linters_by_ft['json'] = nil
            -- lint.linters_by_ft['text'] = nil

            -- Create autocommand which carries out the actual linting
            -- on the specified events.
            local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
            vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
                group = lint_augroup,
                callback = function()
                    require("lint").try_lint()
                end,
            })
        end,
    },
}
