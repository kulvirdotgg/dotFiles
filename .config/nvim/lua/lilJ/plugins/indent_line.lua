---@module 'lazy'
---@type LazySpec
return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module 'ibl'
    ---@type ibl.config
    opts = {
        indent = { char = "┊" },
        whitespace = { highlight = { "Whitespace", "NonText" } },
    },
}
-- vim: ts=2 sts=2 sw=2 et
