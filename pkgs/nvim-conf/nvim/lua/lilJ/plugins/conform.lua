return {
    "stevearc/conform.nvim",
    opts = {
        notify_on_error = false,
        format_on_save = function(bufnr)
            local disable_filetypes = {}
            return {
                timeout_ms = 500,
                lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
            }
        end,
        formatters_by_ft = {
            c = { "clang-format" },
            css = { "prettier" },
            go = { "gofumpt", "goimports-reviser" },
            html = { "prettier" },
            lua = { "stylua" },
            typescript = { "prettier" },
            typescriptreact = { "prettier" },
        },
    },
}
