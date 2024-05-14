local builtin = require('telescope.builtin')

require('telescope').setup({
    defaults = {
        file_ignore_patterns = { ".git/", "node_modules" },
        layout_strategy = 'horizontal',
        prompt_prefix = '🔭 ',
        selection_caret = ' ',
        initial_mode = 'insert',
    },
})
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
