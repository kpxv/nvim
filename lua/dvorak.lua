local map = function(mode, lhs, rhs, opts)
    vim.keymap.set(mode, lhs, rhs, opts)
end

local full_map = function(lhs, rhs, opts)
    map("n", lhs, rhs, opts)
    map("v", lhs, rhs, opts)
    map("x", lhs, rhs, opts)
    map("s", lhs, rhs, opts)
end

-- Dvorak

full_map("h", "h")
full_map("t", "j")
full_map("n", "k")
full_map("s", "l")
