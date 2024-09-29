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
    { 'AlexvZyl/nordic.nvim',             lazy = false },
    { "tiagovla/tokyodark.nvim",          lazy = false },
    -- { 'projekt0n/github-nvim-theme',      lazy = false },
    { "folke/tokyonight.nvim",            lazy = false },
    { 'shaunsingh/nord.nvim',             lazy = false },
    -- { 'rebelot/kanagawa.nvim',            lazy = false },
    { 'sho-87/kanagawa-paper.nvim',       lazy = false },
    { 'sainnhe/gruvbox-material',         lazy = false },
    { 'nyoom-engineering/oxocarbon.nvim', lazy = false },
    { 'sainnhe/everforest',               lazy = false },
    { 'FrenzyExists/aquarium-vim',        lazy = false },
    { 'lewpoly/sherbet.nvim',             lazy = false },
    { 'dasupradyumna/midnight.nvim',      lazy = false },
    { 'alexmozaidze/palenight.nvim',      lazy = false },

    {
        'm-demare/hlargs.nvim',
        config = function()
            require('hlargs').setup()
        end
    },

    --[[ {
        "nvim-lualine/lualine.nvim",
        lazy = false,
        dependencies = { 'nvim-tree/nvim-web-devicons', opts = true }
    }, ]]

    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
        setup = true
    },

    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
    },

    --[[ {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup {}
        end,
    }, ]]

    {
        'gelguy/wilder.nvim',
        config = function()
            require('wilder').setup({ modes = { ':', '/', '?' } })
        end,
        dependencies = {
            'roxma/nvim-yarp',
            'roxma/vim-hug-neovim-rpc'
        },
        lazy = true
    },

    -- File nav
    { 'theprimeagen/harpoon' },

    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    { 'mbbill/undotree' },

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
        lazy = false,
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
    { "rcarriga/nvim-dap-ui",        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },

    --[[ {
        'ms-jpq/coq_nvim',
        branch = 'coq',
        lazy = true,
    },
    {
        'ms-jpq/coq.thirdparty',
        branch = '3p',
        lazy = true,
    }, ]]
    {
        "hedyhli/outline.nvim",
        lazy = true,
        cmd = { "Outline", "OutlineOpen" },
        opts = {
        },
    },

    { 'rmagatti/goto-preview' },

    {
        'lervag/vimtex',
        lazy = false,
    },

    {
        'numtostr/comment.nvim',
        config = true,
    },

    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },

    -- Git
    { 'tpope/vim-fugitive' },
}
