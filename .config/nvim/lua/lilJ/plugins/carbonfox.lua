return {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    init = function()
        require("nightfox").setup {
            transparent_background = true,
        }
        vim.cmd.colorscheme "carbonfox"

        vim.cmd.hi "Comment gui=none"
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })

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
