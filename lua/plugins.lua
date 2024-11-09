return {
    {
        -- Main colorscheme
        'rebelot/kanagawa.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme kanagawa]])
        end,
    },

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 500
        end,
        opts = {}
    },

    -- Other colorschemes
    { "rose-pine/neovim",                 lazy = false },
    { "catppuccin/nvim",                  name = 'catppuccin', lazy = false },
    -- { 'AlexvZyl/nordic.nvim',             lazy = false },
    { "tiagovla/tokyodark.nvim",          lazy = false },
    -- { "folke/tokyonight.nvim",            lazy = false },
    -- { 'rebelot/kanagawa.nvim',            lazy = false },
    -- { 'nyoom-engineering/oxocarbon.nvim', lazy = false },
    -- { 'lewpoly/sherbet.nvim',             lazy = false },
    -- { 'alexmozaidze/palenight.nvim',      lazy = false },
    -- { 'rmehri01/onenord.nvim',            lazy = false },
    { 'Shatur/neovim-ayu',                lazy = false },
    -- { 'sainnhe/sonokai',                  lazy = false },
    {
        'olimorris/onedarkpro.nvim',
        lazy = false,
        opts = {
            colors = {
                cursorline = "#323843",
            },
            options = {
                cursorline = true,
                transparency = false,
                terminal_colors = true,
            },
        },
    },

    {
        'm-demare/hlargs.nvim',
        event = "VeryLazy",
        opts = {},
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
        event = "VeryLazy",
        setup = true
    },

    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
    },

    {
        'gelguy/wilder.nvim',
        event = "VeryLazy",
        opts = { modes = { ':', '/', '?', } },
    },

    -- File nav
    { 'theprimeagen/harpoon' },

    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        event = "VeryLazy",
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    {
        'mbbill/undotree',
        event = "VeryLazy",
    },

    -- LSP and related
    {
        'williamboman/mason.nvim',
        lazy = false,
    },
    { 'williamboman/mason-lspconfig.nvim', lazy = false },
    { 'neovim/nvim-lspconfig',             lazy = false },

    {
        'L3MON4D3/LuaSnip',
        version = "v2.*",
        run = "make install_jsregexp",
        event = "VeryLazy"
    },

    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "luvit-meta/library", words = { "vim%.uv" } },
            },
        },
    },
    { "Bilal2453/luvit-meta",        lazy = true }, -- optional `vim.uv` typings
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'neovim/nvim-lspconfig',
            'hrsh7th/cmp-nvim-lsp',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip'
        },
        opts = function(_, opts)
            opts.sources = opts.sources or {}
            table.insert(opts.sources, {
                name = "lazydev",
                group_index = 0, -- set group index to 0 to skip loading LuaLS completions
            })
        end,
        lazy = false,
    },

    { 'mfussenegger/nvim-dap' },
    { 'jay-babu/mason-nvim-dap.nvim' },
    {
        'theHamsta/nvim-dap-virtual-text',
        dependencies = { "mfussenegger/nvim-dap" },
        opts = {},
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio"
        }
    },

    -- {
    --     "hedyhli/outline.nvim",
    --     cmd = { "Outline", "OutlineOpen" },
    --     opts = {},
    -- },

    { 'rmagatti/goto-preview' },

    {
        'lervag/vimtex',
        lazy = false,
    },

    {
        'numtostr/comment.nvim',
        opts = {},
    },

    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },

    -- Git
    -- { 'tpope/vim-fugitive',   event = "VeryLazy" },
}
