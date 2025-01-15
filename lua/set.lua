vim.opt.number = true
vim.opt.relativenumber = true

local tab_size = 4

vim.opt.tabstop = tab_size
vim.opt.softtabstop = tab_size
vim.opt.shiftwidth = tab_size
vim.opt.expandtab = false

vim.opt.smartindent = true
vim.opt.cindent = true

vim.opt.cursorline = true
vim.opt.colorcolumn = "80"
vim.opt.termguicolors = true
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.scrolloff = 16
vim.opt.signcolumn = "auto"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 200

vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_view_forward_search_on_start = 0
vim.g.vimtex_mappings_disable = {
	["n"] = { "tse", "tsc", "ts$", "tsd", "tsD", "tsf", "tsb" }
}

vim.g.mapleader = " "
vim.g.maplocalleader = ","
