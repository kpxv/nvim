local map = function(mode, in_map, out_map, extra)
    vim.keymap.set(mode, in_map, out_map, extra)
end
local dap = require('dap')
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local builtin = require('telescope.builtin')

-- Multi-file navigation
map('n', '<leader>pv', '<cmd>Ex<CR>')

map("n", "<C-h>", "<cmd>wincmd h<CR>")
map("n", "<C-j>", "<cmd>wincmd j<CR>")
map("n", "<C-k>", "<cmd>wincmd k<CR>")
map("n", "<C-l>", "<cmd>wincmd l<CR>")

map('n', '<leader>gs', vim.cmd.Git)

map("n", "<leader>a", mark.add_file)
map("n", "<C-e>", ui.toggle_quick_menu)

map("n", "<c-o>", function() ui.nav_file(1) end)
map("n", "<C-n>", function() ui.nav_file(2) end)
map("n", "<C-p>", function() ui.nav_file(3) end)
map("n", "<C-i>", function() ui.nav_file(4) end)

map('n', '<leader>pf', builtin.find_files, {})
-- map('n', '<C-p>', builtin.git_files, {})
map('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

map('n', '<leader>oc', '<cmd>vs<cr><cmd>e ~/.config/nvim<cr>')

-- Current-file navigation
map('n', '<c-d>', '<c-d>zz')
map('n', '<c-u>', '<c-u>zz')
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

map("n", "<leader>u", vim.cmd.UndotreeToggle)

-- LSP navigation
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

map('n', '<leader>l', '<cmd>AerialToggle!<cr>')

-- In-file use
map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '>-2<CR>gv=gv")
map("n", "J", "mzJ`z")
map("x", "<leader>p", "\"dP")
map("n", "<leader>y", "\"+y")
map("v", "<leader>y", "\"+y")
map("n", "<leader>Y", "\"+Y")
-- map('n', '<leader>f', 'mzGVgg=<esc>z')
map("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
map("n", "<CR>", "<cmd>nohls<CR>")

-- Tree-sitter fix
map("n", "<leader><CR>", "<cmd>write | edit | TSBufEnable highlight <CR>")

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
map ('n', '<leader>kt', '<cmd>Telescope colorscheme<cr>')
--
--
--
--
--
--
--
--
-- Switch projects
map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Format
map("n", "<leader>f", function()
    vim.lsp.buf.format()
end)

-- Quicklist?
--[[ map("n", "<C-k>", "<cmd>cnext<CR>zz")
map("n", "<C-j>", "<cmd>cprev<CR>zz")
map("n", "<leader>k", "<cmd>lnext<CR>zz")
map("n", "<leader>j", "<cmd>lprev<CR>zz") ]]
