vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.cin = true

vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.termguicolors = true
vim.opt.colorcolumn = "80"

vim.opt.swapfile = false
vim.opt.backup = false
vim.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.smartcase = true

vim.opt.scrolloff = 16
vim.opt.signcolumn = "no"
vim.opt.isfname:append("@-@") -- lets vim recognize filenames with "@" in them

vim.opt.updatetime = 200

-- disable netrw for nvim tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- vim.cmd [[ let g:coq_settings = { 'auto_start': 'shut-up' } ]]
vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_view_forward_search_on_start = 0
vim.cmd [[let g:vimtex_mappings_disable = {
    \ 'n': ['tse', 'tsc', 'ts$', 'tsd', 'tsD', 'tsf', 'tsb']
    \}
]]

vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.g.gruvbox_material_foreground = "mix"
