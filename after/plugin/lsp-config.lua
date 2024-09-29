local mason = require("mason")
local mdap = require("mason-nvim-dap")
local mlsp = require("mason-lspconfig")
local lsp = require("lspconfig")
local dapui = require("dapui")

local cmp = require "cmp"

local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()

local luasnip = require('luasnip')

cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
    },
    mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['<C-space>'] = cmp.mapping.complete(),
        -- ['s-<tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),

        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
                -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                -- that way you will only jump inside the snippet region
            elseif luasnip.expand_or_locally_jumpable() then
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

mason.setup()
mlsp.setup()
mlsp.setup_handlers {
    function(servername)
        lsp[servername].setup({ capabilities = cmp_capabilities })
    end
}
vim.diagnostic.config({ signs = false, })
mdap.setup({
    ensure_installed = { "python", "cppdebug" },
    automatic_installation = true,
    handlers = {}
})
dapui.setup()
