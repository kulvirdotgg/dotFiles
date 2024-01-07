return{
    {
        "nvim-lua/plenary.nvim",
        name = "plenary",
    },

	"github/copilot.vim",

    "lewis6991/gitsigns.nvim",


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

    "nvim-tree/nvim-web-devicons",

    {
        "NvChad/nvim-colorizer.lua",
        opts = {
            user_default_options = {
                tailwind = true,
            },
        },
    },
}
