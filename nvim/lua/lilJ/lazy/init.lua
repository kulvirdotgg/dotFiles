return {
    "nvim-lua/plenary.nvim", 

    "github/copilot.vim",

    "nvim-tree/nvim-web-devicons",

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
        "folke/todo-comments.nvim",
        dependencies = { 
            "nvim-lua/plenary.nvim" 
        },
        -- TODO: this is not working
        opts = {},
    },

    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
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

    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },
}
