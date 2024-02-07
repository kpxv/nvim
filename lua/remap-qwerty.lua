local map = function(mode, lhs, rhs, opts)
    vim.keymap.set(mode, lhs, rhs, opts)
end

local full_map = function(lhs, rhs, opts)
    map("n", lhs, rhs, opts)
    map("v", lhs, rhs, opts)
end

full_map("j", "h")
full_map("k", "j")
full_map("l", "k")
full_map(";", "l")

-- File navigation
map('n', '<leader>jj', function() require('telescope.builtin').find_files() end)
map('n', '<leader>jd', function() require('telescope.builtin').live_grep() end)
map('n', '<leader>ja', '<cmd>NvimTreeToggle<cr>')

map ("n", "<BS>", "<cmd>b#<cr>")

map('n', '<leader>a', function() require("harpoon.mark").add_file() end)
map('n', '<leader>e', function() require("harpoon.ui").toggle_quick_menu() end)
map('n', '<c-a>', function() require("harpoon.ui").nav_file(1) end)
map('n', '<c-s>', function() require("harpoon.ui").nav_file(2) end)
map('n', '<c-d>', function() require("harpoon.ui").nav_file(3) end)
map('n', '<c-f>', function() require("harpoon.ui").nav_file(4) end)

map('n', '<leader>o', '<cmd>Outline<cr>')

map('n', '<c-d>', '<c-d>zz')
map('n', '<c-u>', '<c-u>zz')
map('n', 'l', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'k', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

map("n", "<leader>u", vim.cmd.UndotreeToggle)


-- Actions
map('v', 'K', ":m '>+1<CR>gv=gv")
map('v', 'L', ":m '>-2<CR>gv=gv")
map("n", "K", "mzJ`z")
map("x", "<leader>p", "\"dP")
map("n", "<leader>y", "\"+y")
map("v", "<leader>y", "\"+y")
map("n", "<leader>Y", "\"+Y")
map("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
map("n", "<CR>", "<cmd>nohls<CR>")

-- Misc
map('n', '<leader>vk', function() require('telescope.builtin').colorscheme() end)
