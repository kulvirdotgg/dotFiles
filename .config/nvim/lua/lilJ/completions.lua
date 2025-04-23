local luasnip = require "luasnip"
luasnip.config.setup {
    history = false,
    updateevents = "TextChanged,TextChangedI",
}

require("luasnip.loaders.from_vscode").lazy_load()

local lspkind = require "lspkind"
lspkind.init {}

local cmp = require "cmp"
cmp.setup {
    window = {
        documentation = {
            border = "rounded",
        },
        completion = {
            border = "rounded",
        },
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "buffer" },
    },
    completion = {
        completeopt = "menu, menuone, noinsert, noselect",
    },
    formatting = {
        fields = { "kind", "abbr", "menu" },
        expandable_indicator = true,
        format = lspkind.cmp_format {
            mode = "symbol",
        },
    },

    -- No, but seriously. Please read `:help ins-completion`, it is really good!
    mapping = cmp.mapping.preset.insert {
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),

        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),

        ["<C-y>"] = cmp.mapping.confirm { select = true },

        ["<C-Space>"] = cmp.mapping.complete {},

        -- Think of <c-l> as moving to the right of your snippet expansion.
        --  So if you have a snippet that's like:
        --  function $name($args)
        --    $body
        --  end
        --
        -- <c-l> will move you to the right of each of the expansion locations.
        -- <c-h> is similar, except moving you backwards.
        ["<C-l>"] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
                luasnip.expand_or_jump()
            end
        end, { "i", "s" }),
        ["<C-h>"] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
                luasnip.jump(-1)
            end
        end, { "i", "s" }),
    },

    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
}
