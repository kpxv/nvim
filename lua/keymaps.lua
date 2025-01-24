vim.keymap.set("n", "<Space>", "<Nop>")
vim.keymap.set("n", "-", "<Nop>")

vim.keymap.set("n", "<BS>", "<C-^>")
vim.keymap.set("n", "0", "|")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("x", "<leader>p", "\"dP")
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
vim.keymap.set("n", "<CR>", "<cmd>nohls<CR>")

vim.keymap.set("n", "<Right>", [[<cmd> vertical resize +5<cr>]])
vim.keymap.set("n", "<Left>", [[<cmd> vertical resize -5<cr>]])
vim.keymap.set("n", "<Up>", [[<cmd> horizontal resize +2<cr>]])
vim.keymap.set("n", "<Down>", [[<cmd> horizontal resize -2<cr>]])

vim.keymap.set("n", "<leader>rc", "<cmd>vs ~/.config/nvim<cr>")


-- Harpoon

vim.keymap.set("n", "<leader>a", function() require("harpoon"):list():add() end)
vim.keymap.set("n", "<C-e>", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end)

vim.keymap.set("n", "<C-h>", function() require("harpoon"):list():select(1) end)
vim.keymap.set("n", "<C-t>", function() require("harpoon"):list():select(2) end)
vim.keymap.set("n", "<C-n>", function() require("harpoon"):list():select(3) end)
vim.keymap.set("n", "<C-s>", function() require("harpoon"):list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() require("harpoon"):list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() require("harpoon"):list():next() end)



-- Undotree

vim.keymap.set("n", "<leader>u", function() vim.cmd.UndotreeToggle() end)


-- fzf-lua

vim.keymap.set("n", "<leader>hh", function() require("fzf-lua").files() end)
vim.keymap.set("n", "<leader>he", function() require("fzf-lua").live_grep() end)
vim.keymap.set("n", "<leader>kt", function() require("fzf-lua").colorschemes() end)


-- LSP

vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end)
vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end)
vim.keymap.set("i", "<C-i>", function() vim.lsp.buf.hover() end)
vim.keymap.set("n", "<F2>", function() vim.lsp.buf.rename() end)
