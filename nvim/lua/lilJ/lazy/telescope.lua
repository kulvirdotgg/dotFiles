return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.5",

    dependencies = {
		"nvim-lua/plenary.nvim",
    },

    config = function()
        require('telescope').setup({
            defaults = {
                file_ignore_patterns = { ".git/", "node%_modules/.*" },
                layout_strategy = 'horizontal',
                prompt_prefix = '🔭 ',
                selection_caret = ' ',
                initial_mode = 'insert',
            },
        })

        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<leader>f', builtin.find_files, {})
        vim.keymap.set('n', '<c-p>', builtin.git_files, {})
        -- vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        -- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
    end
}
