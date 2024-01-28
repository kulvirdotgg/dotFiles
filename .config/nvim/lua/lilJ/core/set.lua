vim.opt.nu = true
vim.opt.rnu = true

vim.opt.autoread = true

-- Prevent continue comment on new line
vim.api.nvim_create_autocmd(
    "FileType",
    { pattern = "*", command = [[setlocal formatoptions-=c formatoptions-=r formatoptions-=o]] }
)
vim.opt.wildignore = "*/.git/*,*/.DS_Store/*,*/target/*,*/node_modules/*" 

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.smartcase = true

vim.opt.wrap = false 

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'

vim.cmd.termguicolors = true

-- netrw settings
vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 0
vim.g.netrw_winsize = 25

vim.o.wrapmargin = 0
vim.o.textwidth = 0

vim.o.wrap = true
vim.o.linebreak = true
vim.o.breakindent = true
vim.o.showbreak = "↳ "
vim.opt_local.columns = 144
