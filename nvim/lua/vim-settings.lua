vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set clipboard+=unnamedplus")
vim.cmd("set number")
vim.opt.termguicolors = true
vim.cmd("filetype plugin indent on")
vim.g.mapleader = " "
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.ts",
  command = "silent !npm run dev &",
})
vim.opt.foldenable = false
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldcolumn = "0"
vim.opt.foldtext = ""
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldnestmax = 3
vim.opt.spell = true
vim.opt.spelllang = "en_us"


