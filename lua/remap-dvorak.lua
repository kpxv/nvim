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

map("n", "<C-h>", "<cmd>wincmd h<CR>")
map("n", "<C-t>", "<cmd>wincmd j<CR>")
map("n", "<C-n>", "<cmd>wincmd k<CR>")
map("n", "<C-s>", "<cmd>wincmd l<CR>")

full_map('j', 't')
full_map('k', 'n')
full_map('l', 's')

-- File navigation
map('n', '<leader>hh', function() require('telescope.builtin').find_files() end)
map('n', '<leader>he', function() require('telescope.builtin').live_grep() end)
map('n', '<leader>ha', '<cmd>NvimTreeToggle<cr>')

map('n', '<leader>a', function() require("harpoon.mark").add_file() end)
map('n', '<leader>e', function() require("harpoon.ui").toggle_quick_menu() end)
map('n', '<c-a>', function() require("harpoon.ui").nav_file(1) end)
map('n', '<c-o>', function() require("harpoon.ui").nav_file(2) end)
map('n', '<c-e>', function() require("harpoon.ui").nav_file(3) end)
map('n', '<c-u>', function() require("harpoon.ui").nav_file(4) end)

map('n', '<leader>r', '<cmd>Outline<cr>')

-- Misc
map('n', '<leader>kt', function() require('telescope.builtin').colorscheme() end)
