return {
    "saghen/blink.cmp",
    event = "InsertEnter",

    -- use a release tag to download pre-built binaries
    version = "1.*",
    dependencies = {
        "folke/lazydev.nvim",
    },

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        -- See :h blink-cmp-config-keymap for defining your own keymap
        keymap = { preset = "default" },

        appearance = {
            nerd_font_variant = "mono",
        },

        completion = {
            documentation = { auto_show = true, auto_show_delay_ms = 500, window = { border = "rounded" } },

            menu = {
                border = "rounded",
                draw = {
                    columns = {
                        { "kind_icon", "label", "label_description", gap = 1 },
                        { "kind" },
                    },
                    treesitter = { "lsp" },
                },
            },
        },

        -- Default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, due to `opts_extend`
        sources = {
            default = { "lsp", "path", "lazydev", "snippets", "buffer" },
            providers = {
                lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
            },
        },

        fuzzy = { implementation = "prefer_rust_with_warning" },

        -- Shows a signature help window while you type arguments for a function
        signature = { enabled = true, window = { border = "rounded" } },
    },
    opts_extend = { "sources.default" },
}
