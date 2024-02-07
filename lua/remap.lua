local map = function(a, b, c, d)
    vim.keymap.set(a, b, c, d)
end
--[[ local map = function(mode, in_map, out_map, extra)
    vim.keymap.set(mode, in_map, out_map, extra)
end ]]
local dap = require('dap')
local hmark = require("harpoon.mark")
local hui = require("harpoon.ui")
local tbuiltin = require('telescope.builtin')

-- File navigation
map('n', '<leader>ja', '<cmd>Ex<CR>')
map('n', '<leader>nn', '<cmd>Neotree toggle<CR>')

map("n", "<leader>a", hmark.add_file)
map("n", "<C-e>", hui.toggle_quick_menu)

map("n", "<c-o>", function() hui.nav_file(1) end)
map("n", "<C-n>", function() hui.nav_file(2) end)
map("n", "<C-p>", function() hui.nav_file(3) end)
map("n", "<C-i>", function() hui.nav_file(4) end)

map ("n", "<BS>", "<cmd>b#<cr>")

-- Buffer navigation
map("n", "<C-h>", "<cmd>wincmd h<CR>")
map("n", "<C-j>", "<cmd>wincmd j<CR>")
map("n", "<C-k>", "<cmd>wincmd k<CR>")
map("n", "<C-l>", "<cmd>wincmd l<CR>")

-- Search files
map('n', '<leader>jj', tbuiltin.find_files, {})
map('n', '<leader>gs', tbuiltin.git_files, {})
map('n', '<leader>ps', function()
    tbuiltin.grep_string({ search = vim.fn.input("Grep > ") });
end)

-- Movement
map('n', '<c-d>', '<c-d>zz')
map('n', '<c-u>', '<c-u>zz')
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map('n', 'zq', 'mz<cmd>AerialPrev<CR>zt`z')

map("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Actions
map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '>-2<CR>gv=gv")
map("n", "J", "mzJ`z")
map("x", "<leader>p", "\"dP")
map("n", "<leader>y", "\"+y")
map("v", "<leader>y", "\"+y")
map("n", "<leader>Y", "\"+Y")
map("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
map("n", "<CR>", "<cmd>nohls<CR>")
-- map('n', '<leader>f', 'mzGVgg=<esc>z')

-- Git
map('n', '<leader>gd', '<cmd>Git diff<CR>')
-- Git actions
map('n', '<leader>ga', '<cmd>Git add -A<CR>')
map('n', '<leader>gc', '<cmd>Git commit<CR>')
map('n', '<leader>gph', '<cmd>Git push<CR>')
map('n', '<leader>gpl', '<cmd>Git pull<CR>')

-- Markdown stuff
local wrapping = false
local linebreaking = false

map("n", "<leader>ww", function()
    if wrapping == true then
        vim.opt.wrap = false
        wrapping = false
    else
        vim.opt.wrap = true
        wrapping = true
    end
end)
map("n", "<leader>wl", function()
    if linebreaking == true then
        vim.opt.linebreak = false
        linebreaking = false
    else
        vim.opt.linebreak = true
        linebreaking = true
    end
end)
map('n', '<leader>wp', '<cmd>MarkdownPreviewToggle<CR>')

-- LaTeX & snippets
vim.cmd [[
    " Expand snippets in insert mode with Tab
    imap <silent><expr> <A-Tab> luasnip#expandable() ? '<Plug>luasnip-expand-snippet' : '<A-Tab>'

    " Jump forward in through tabstops in insert and select mode with Tab
    imap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'
    smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'
    imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
    smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
]]

-- vim.cmd [[
-- " Use Tab to expand and jump through snippets
-- imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
-- smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'
--
-- " Use Shift-Tab to jump backwards through snippets
-- imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
-- smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
-- ]]

-- LSP actions
map("n", "<leader>f", function() vim.lsp.buf.format({ 4, true, true, false, true }) end)
map('n', '<leader>po', function() require('symbols-outline').toggle_outline() end)

-- LSP information
map('n', '<leader>l', '<cmd>AerialToggle!<cr>')

map("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
    { silent = true, noremap = true }
)
map("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
    { silent = true, noremap = true }
)
map("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
    { silent = true, noremap = true }
)
map("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
    { silent = true, noremap = true }
)
map("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
    { silent = true, noremap = true }
)
map("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
    { silent = true, noremap = true }
)

-- Debug
map("n", "<leader>dw", function()
    require('dapui').toggle()
end)
map("n", "<leader>db", function()
    dap.toggle_breakpoint()
end)
map("n", "<F5>", function()
    dap.continue()
end)
map("n", "<F1>", function() dap.step_into() end)
map("n", "<F2>", function() dap.step_over() end)
map("n", "<F3>", function() dap.step_out() end)

-- Misc
map("n", "<leader>cml", "<cmd>CellularAutomaton make_it_rain<CR>")
map('n', '<leader>kt', '<cmd>Telescope colorscheme<cr>')
map('n', '<leader>oc', '<cmd>vs<cr><cmd>e ~/.config/nvim<cr>')
--
-- Quicklist?
--[[ map("n", "<C-k>", "<cmd>cnext<CR>zz")
map("n", "<C-j>", "<cmd>cprev<CR>zz")
map("n", "<leader>k", "<cmd>lnext<CR>zz")
map("n", "<leader>j", "<cmd>lprev<CR>zz") ]]
