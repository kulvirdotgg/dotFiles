return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    opts = {
        ensure_installed = { "go", "lua", "typescript" },
        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = { "ruby" },
        },
        indent = { enable = true, disable = { "ruby" } },
    },
    config = function(_, opts)
        ---@diagnostic disable-next-line: missing-fields
        require("nvim-treesitter.configs").setup(opts)
    end,
}
