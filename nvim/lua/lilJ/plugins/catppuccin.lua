return {
    "catppuccin/nvim",
    name = "catpuccin",
    priority = 1000,
    lazy = false,
    init = function()
        require("catppuccin").setup {
            transparent_background = true,
        }
        vim.cmd.colorscheme "catppuccin"

        vim.cmd.hi "Comment gui=none"
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
            border = "rounded",
        })

        vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
            border = "rounded",
        })

        vim.diagnostic.config {
            float = { border = "rounded" },
        }
    end,
}
