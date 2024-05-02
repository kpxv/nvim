local map = function(mode, lhs, rhs, opts)
    vim.keymap.set(mode, lhs, rhs, opts)
end

local full_map = function(lhs, rhs, opts)
    map("n", lhs, rhs, opts)
    map("v", lhs, rhs, opts)
end

-- Dvorak
-- Main navigation
full_map("h", "h")
full_map("t", "j")
full_map("n", "k")
full_map("s", "l")

map("n", "<C-w><C-h>", "<cmd>wincmd h<CR>")
map("n", "<C-w><C-t>", "<cmd>wincmd j<CR>")
map("n", "<C-w><C-n>", "<cmd>wincmd k<CR>")
map("n", "<C-w><C-s>", "<cmd>wincmd l<CR>")

map("n", "<C-w>h", "<cmd>wincmd h<CR>")
map("n", "<C-w>t", "<cmd>wincmd j<CR>")
map("n", "<C-w>n", "<cmd>wincmd k<CR>")
map("n", "<C-w>s", "<cmd>wincmd l<CR>")

-- File navigation
map('n', '<leader>hh', function() require('telescope.builtin').find_files() end)
map('n', '<leader>he', function() require('telescope.builtin').live_grep() end)
map('n', '<leader>ha', '<cmd>NvimTreeToggle<cr>')

map("n", "<BS>", "<cmd>b#<cr>")

map('n', '<leader>a', function() require("harpoon.mark").add_file() end)
map('n', '<leader>e', function() require("harpoon.ui").toggle_quick_menu() end)
map('n', '<c-u>', function() require("harpoon.ui").nav_file(1) end)
map('n', '<c-e>', function() require("harpoon.ui").nav_file(2) end)
map('n', '<c-o>', function() require("harpoon.ui").nav_file(3) end)
map('n', '<c-a>', function() require("harpoon.ui").nav_file(4) end)

map('n', '<leader>r', '<cmd>Outline<cr>')

map('n', '<c-d>', '<c-d>zz')
-- map('n', '<c-u>', '<c-u>zz')
map('n', 'n', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 't', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- map("n", "<leader>f", vim.cmd.UndotreeToggle)

-- Actions
map('v', 'T', ":m '>+1<CR>gv=gv")
map('v', 'N', ":m '>-2<CR>gv=gv")
map("n", "T", "mzJ`z")
map("x", "<leader>p", "\"dP")
map("n", "<leader>y", "\"+y")
map("v", "<leader>y", "\"+y")
map("n", "<leader>Y", "\"+Y")
map("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
map("n", "<CR>", "<cmd>nohls<CR>")

-- LSP Junk
map("n", "<leader>u", function() vim.lsp.buf.format({ 4, true, true, false, true }) end)

-- Misc
map('n', '<leader>kt', function() require('telescope.builtin').colorscheme() end)

vim.keymap.set('n', 'gd', function() require('goto-preview').goto_preview_definition() end)
vim.keymap.set('n', 'gt', function() require('goto-preview').goto_preview_type_definition() end)
vim.keymap.set('n', 'gi', function() require('goto-preview').goto_preview_implementation() end)
vim.keymap.set('n', 'gD', function() require('goto-preview').goto_preview_declaration() end)
vim.keymap.set('n', 'gr', function() require('goto-preview').goto_preview_references() end)
vim.keymap.set('n', 'gp', function() require('goto-preview').close_all_win() end)

vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
vim.keymap.set('n', 'gtd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
vim.keymap.set('n', 'gtD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
vim.keymap.set('n', 'gti', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
vim.keymap.set('n', 'gto', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
vim.keymap.set('n', 'gtr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
vim.keymap.set('n', 'gts', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)

-- Window resizing
vim.keymap.set("n", "<Right>", [[<cmd>vertical resize +5<cr>]])
vim.keymap.set("n", "<Left>", [[<cmd>vertical resize -5<cr>]])
vim.keymap.set("n", "<Down>", [[<cmd>horizontal resize +2<cr>]])
vim.keymap.set("n", "<Up>", [[<cmd>horizontal resize -2<cr>]])

-- Open config
map('n', '<leader>rc', '<cmd>vs ~/.config/nvim<cr>')


-- Dvorak Fixes
full_map('j', 't')
full_map('k', 'n')
full_map('l', 's')
