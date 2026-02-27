-- ======================
-- Core editor behavior
-- ======================

vim.g.mapleader = " "

vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"

-- ======================
-- Window navigation
-- ======================
vim.keymap.set("n", "<leader>wh", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<leader>wj", "<C-w>j", { desc = "Move to window below" })
vim.keymap.set("n", "<leader>wk", "<C-w>k", { desc = "Move to window above" })
vim.keymap.set("n", "<leader>wl", "<C-w>l", { desc = "Move to right window" })
vim.keymap.set("n", "<leader>ww", "<C-w>w", { desc = "Cycle windows" })
vim.opt.splitright = true

-- Use spaces everywhere by default
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.cindent = true
-- ======================
-- Google C++ Style
-- ======================

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "cpp", "c", "h", "hpp" },
  callback = function()
    vim.opt_local.expandtab = true
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.shiftwidth = 4
  end,
})

-- ======================
-- Treesitter folding only
-- ======================

vim.opt.foldenable = false
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldcolumn = "0"
vim.opt.foldtext = ""
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldnestmax = 3

-- Disable Treesitter indentation (causes weird C++)
pcall(function()
  require("nvim-treesitter.configs").setup {
    indent = { enable = false },
  }
end)

-- ======================
-- Spell check
-- ======================

vim.opt.spell = true
vim.opt.spelllang = "en_us"

-- ======================
-- Auto run dev server for TS (your existing hook)
-- ======================

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.ts",
  command = "silent !npm run dev &",
})

