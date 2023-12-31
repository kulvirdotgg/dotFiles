vim.opt.nu = true
vim.opt.rnu = true

vim.opt.autoread = true

-- Prevent continue comment on new line
vim.api.nvim_create_autocmd(
    "FileType",
    { pattern = "*", command = [[setlocal formatoptions-=c formatoptions-=r formatoptions-=o]] }
)

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'

vim.cmd.termguicolors = true

