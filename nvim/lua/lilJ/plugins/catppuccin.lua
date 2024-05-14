return {
    "catppuccin/nvim",
    name = "catpuccin",
    priority = 1000,
    init = function()
        require("catppuccin").setup {
            transparent_background = true,
        }
        vim.cmd.colorscheme "catppuccin"

        vim.cmd.hi "Comment gui=none"
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end,
}
