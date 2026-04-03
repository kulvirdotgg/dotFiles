---@module 'lazy'
---@type LazySpec
return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local lint = require "lint"

        lint.linters_by_ft = {
            typescript = { "oxlint" },
            typescriptreact = { "oxlint" },
        }

        local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            group = lint_augroup,
            callback = function()
                if vim.bo.modifiable then lint.try_lint() end
            end,
        })
    end,
}
-- vim: ts=2 sts=2 sw=2 et
