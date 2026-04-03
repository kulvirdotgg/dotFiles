---@module 'lazy'
---@type LazySpec
return {
    "catppuccin/nvim",
    name = "catpuccin",
    priority = 1000,
    lazy = false,
    init = function()
        require("catppuccin").setup {
            transparent_background = true,
            float = {
                solid = true,
                transparent = true,
            },
        }
        vim.cmd.colorscheme "catppuccin"
    end,
}
-- vim: ts=2 sts=2 sw=2 et
