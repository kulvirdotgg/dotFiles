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
    end,
}
