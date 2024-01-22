return {
    "hrsh7th/nvim-cmp",

    event = "InsertEnter",

    dependencies = {
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "rafamadriz/friendly-snippets",
        "onsails/lspkind.nvim",
        "hrsh7th/cmp-buffer",
    },

    config =  function()

        local cmp = require("cmp")
        local luasnip = require("luasnip")

        local lspkind = require("lspkind")
        
        require("luasnip.loaders.from_vscode").lazy_load()
        luasnip.config.setup({})

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },

            completion = {
                completeopt = "menu,menuone,noselect",
            },

            mapping = cmp.mapping.preset.insert({
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                ["CR"] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                }),
            }),

            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "path" },
                { name = "treesitter" },
                { name = "tmux" },
            }, {
                { name = "buffer" },
            }),

            formatting = {
                format = lspkind.cmp_format({
                    maxwidth = 25,
                    ellipses_char = "",
                }),
            },
        })
    end
}
