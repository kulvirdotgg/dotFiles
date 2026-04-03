---@module 'lazy'
---@type LazySpec
return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    ---@module 'conform'
    ---@type conform.setupOpts
    opts = {
        notify_on_error = false,

        format_on_save = function(bufnr)
            local disable_filetypes = { c = true, cpp = true }
            if disable_filetypes[vim.bo[bufnr].filetype] then
                return nil
            else
                return {
                    timeout_ms = 500,
                    lsp_format = "fallback",
                }
            end
        end,

        formatters_by_ft = {
            html = { "oxfmt" },
            lua = { "stylua" },
            typescript = { "oxfmt" },
            typescriptreact = { "oxfmt" },
        },
    },
}
-- vim: ts=2 sts=2 sw=2 et
