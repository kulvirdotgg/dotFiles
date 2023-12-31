vim.g.mapleader = " "
vim.keymap.set("n", "<leader>n", vim.cmd.Ex) 

-- Pasting from clipboard hurts in vim
vim.keymap.set('n', '<leader>p', '"+p')

-- Copying to Clipboard
vim.keymap.set('v', '<leader>y', '"+y')

vim.keymap.set('n', '<leader>h', vim.cmd.split)
vim.keymap.set('n', '<leader>v', vim.cmd.vsplit)

-- Keep ya head straight
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

vim.keymap.set("n", "<Tab>", vim.cmd.bnext)
vim.keymap.set("n", "<S-Tab>", vim.cmd.bprev)
vim.keymap.set('n', '<leader>q', vim.cmd.bdelete)
