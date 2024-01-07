vim.g.mapleader = " "
vim.keymap.set("n", "<leader>n", vim.cmd.Ex)

-- Prime said this is greated remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- some next greatest remaps
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- move lines smooth butter smooth
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Pasting from clipboard hurts in vim
vim.keymap.set('n', 'P', '"+p')

-- Copying to Clipboard
--vim.keymap.set('v', '<leader>y', '"+y')

vim.keymap.set('n', '<leader>h', vim.cmd.split)
vim.keymap.set('n', '<leader>v', vim.cmd.vsplit)

-- Keep ya head straight
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

vim.keymap.set("n", "<Tab>", vim.cmd.bnext)
vim.keymap.set("n", "<S-Tab>", vim.cmd.bprev)
vim.keymap.set('n', '<leader>q', vim.cmd.bdelete)

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),

    callback = function(e)
        vim.bo[e.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        local opts = { buffer = e.buf }

        local keymap = vim.keymap

        keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)

        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

        keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)

        keymap.set("n", "K", vim.lsp.buf.hover, opts)

        keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end, opts)

        keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

        keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts)
    end,
})
