---@module 'lazy'
---@type LazySpec
return {
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",

            build = "make",

            cond = function()
                return vim.fn.executable "make" == 1
            end,
        },
        { "nvim-telescope/telescope-ui-select.nvim" },

        { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
    },

    config = function()
        require "lilJ.telescope"
    end,
}
-- vim: ts=2 sts=2 sw=2 et
