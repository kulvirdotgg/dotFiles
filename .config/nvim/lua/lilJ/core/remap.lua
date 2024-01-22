vim.g.mapleader = " "

vim.keymap.set("n", "<leader>n", vim.cmd.Ex)

-- Prime said this is greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set('n', 'P', '"+p')

-- some next greatest remaps
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")


-- stay in indent mode only
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")


vim.keymap.set('n', '<leader>vp', vim.cmd.split)
vim.keymap.set('n', '<leader>hp', vim.cmd.vsplit)


-- Keep ya head straight
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')


vim.keymap.set("n", "<Tab>", vim.cmd.bnext)
vim.keymap.set("n", "<S-Tab>", vim.cmd.bprev)
vim.keymap.set('n', '<leader>q', vim.cmd.bdelete)
