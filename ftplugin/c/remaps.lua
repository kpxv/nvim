local map = function(mode, lhs, rhs, opts)
    vim.keymap.set(mode, lhs, rhs, opts)
end

-- map('n', '<C-b>', function()
--     local filename = vim.cmd.filename
--
-- end)
