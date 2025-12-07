vim.o.number = true
vim.o.relativenumber = true

local tab_size = 4

vim.o.tabstop = tab_size
vim.o.softtabstop = tab_size
vim.o.shiftwidth = tab_size
vim.o.expandtab = true

vim.o.smartindent = true
vim.o.cindent = true

vim.o.cursorline = true
vim.o.colorcolumn = "80"
vim.o.termguicolors = true
vim.o.wrap = false

vim.o.swapfile = false
vim.o.backup = false
vim.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.undofile = true

vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.scrolloff = 16

vim.o.mouse = ""
vim.o.updatetime = 200

vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_view_forward_search_on_start = 0
vim.g.vimtex_compiler_latexmk = { options = { '-shell-escape' } }
vim.g.vimtex_mappings_disable = {
	["n"] = { "tse", "tsc", "ts$", "tsd", "tsD", "tsf", "tsb" }
}

vim.g.mapleader = " "
vim.g.maplocalleader = '-'
