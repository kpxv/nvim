local go_prev = require('goto-preview')

require('mason').setup()
require('mason-lspconfig').setup()

local cmp = require('cmp')
local lspconfig = require('lspconfig')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
local luasnip = require('luasnip')
-- local coq = require('coq')

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        vim.keymap.set('n', 'gtd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        vim.keymap.set('n', 'gtD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        vim.keymap.set('n', 'gti', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
        vim.keymap.set('n', 'gto', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
        vim.keymap.set('n', 'gtr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
        vim.keymap.set('n', 'gts', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        -- vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set('n', '<leader>f', '<cmd>lua vim.lsp.buf.format()<cr>', opts)
        -- vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

        -- vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
        -- vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
        -- vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
    end
})

local default_setup = function(server)
    lspconfig[server].setup({
        capabilities = lsp_capabilities,
    })
end

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {},
    handlers = {
        default_setup,
        lua_ls = function()
            require('lspconfig').lua_ls.setup({
                settings = {
                    Lua = {
                        runtime = {
                            version = 'LuaJIT'
                        },
                        diagnostics = {
                            globals = { 'vim' },
                        },
                        workspace = {
                            library = {
                                vim.env.VIMRUNTIME,
                            }
                        }
                    }
                }
            })
        end
    }
})

cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    },
    mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['C-space'] = cmp.mapping.complete(),
        -- ['s-<tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),

        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
                -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                -- that way you will only jump inside the snippet region
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }),
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end
    },
    -- revision = {},
    enabled = true,
    -- performance = {},
    -- preselect = {},
    -- completion = {},
    -- confirmation = {},
    -- matching = {},
    -- sorting = {},
    -- formatting = {},
    -- view = {},
    -- experimental = {},
})

go_prev.setup {
    width = 120, -- Width of the floating window
    height = 15, -- Height of the floating window
    border = { "↖", "─", "┐", "│", "┘", "─", "└", "│" }, -- Border characters of the floating window
    default_mappings = false, -- Bind default mappings
    debug = false, -- Print debug information
    opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
    resizing_mappings = true, -- Binds arrow keys to resizing the floating window.
    post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
    post_close_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
    references = { -- Configure the telescope UI for slowing the references cycling window.
        telescope = require("telescope.themes").get_dropdown({ hide_preview = false })
    },
    -- These two configs can also be passed down to the goto-preview definition and implementation calls for one off "peak" functionality.
    focus_on_open = true,                                        -- Focus the floating window when opening it.
    dismiss_on_move = false,                                     -- Dismiss the floating window when moving the cursor.
    force_close = true,                                          -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
    bufhidden = "wipe",                                          -- the bufhidden option to set on the floating window. See :h bufhidden
    stack_floating_preview_windows = true,                       -- Whether to nest floating windows
    preview_window_title = { enable = true, position = "left" }, -- Whether to set the preview window title as the filename
}

vim.keymap.set('n', 'gd', function() go_prev.goto_preview_definition() end)
vim.keymap.set('n', 'gt', function() go_prev.goto_preview_type_definition() end)
vim.keymap.set('n', 'gi', function() go_prev.goto_preview_implementation() end)
vim.keymap.set('n', 'gD', function() go_prev.goto_preview_declaration() end)
vim.keymap.set('n', 'gr', function() go_prev.goto_preview_references() end)
vim.keymap.set('n', 'gp', function() go_prev.close_all_win() end)
