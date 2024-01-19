return {

    "nvim-lua/plenary.nvim", 

    "github/copilot.vim",

    "nvim-tree/nvim-web-devicons",

    {
        "RRethy/vim-illuminate",
        config = function()
            require("illuminate")
        end,
    },

    {
        "FabijanZulj/blame.nvim",
        config = function()
            require("blame").setup{}
        end
    },

    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },

    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end
    },

    {
        "numToStr/Comment.nvim",
        config = function()
            require('Comment').setup({
                toggler = {
                    line = "gcc",
                    block = "gbc",
                },
                opleader = {
                    line = "gc",
                    block = "gb",
                },
            })
        end
    },


    {
        "NvChad/nvim-colorizer.lua",
        opts = {
            user_default_options = {
                tailwind = true,
            },
        },
    },
}
