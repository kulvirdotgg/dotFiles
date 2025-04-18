return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "onsails/lspkind.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-buffer",
        {
            "L3MON4D3/LuaSnip",
            build = "make install_jsregexp",
            dependencies = {
                {
                    "rafamadriz/friendly-snippets",
                    config = function()
                        require("luasnip.loaders.from_vscode").lazy_load()
                    end,
                },
            },
        },
        "saadparwaiz1/cmp_luasnip",
    },
    config = function()
        require "lilJ.completions"
    end,
}
