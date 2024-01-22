return {
	{
		"nvim-treesitter/nvim-treesitter",

		build = ":TSUpdate",

        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
        
        config = function()
            require("nvim-treesitter.configs").setup ({
                ensure_installed = { "typescript", "tsx", "python",  "go", "c", "cpp", "lua", "markdown" },

                sync_install = false,

                auto_install = true,

                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },

                indent = {
                    enable = true,
                },
            })
        end
	},
}
