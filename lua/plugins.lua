return {
    -- Main colorscheme
    {
        'AlexvZyl/nordic.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme nordic]])
        end,
    },

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {}
    },

    -- Other colorschemes
    { "rose-pine/neovim",                lazy = false },
    { "catppuccin/nvim",                 name = 'catppuccin', lazy = false },
    { "ellisonleao/gruvbox.nvim",        lazy = false },
    -- { 'AlexvZyl/nordic.nvim', lazy = false },
    { "Shatur/neovim-ayu",               lazy = false },
    { "rebelot/kanagawa.nvim",           lazy = false },
    { "olivercederborg/poimandres.nvim", lazy = false },
    { "water-sucks/darkrose.nvim",       lazy = false },
    { "tiagovla/tokyodark.nvim",         lazy = false },
    { "folke/tokyonight.nvim",           lazy = false },
    { 'projekt0n/github-nvim-theme',     lazy = false },
    { 'shaunsingh/nord.nvim',            lazy = false },
    { 'sainnhe/edge',                    lazy = false },
    { 'olimorris/onedarkpro.nvim',       lazy = false },

    {
        'm-demare/hlargs.nvim',
        config = function()
            require('hlargs').setup()
        end
    },

    {
        "nvim-lualine/lualine.nvim",
        lazy = false,
        dependencies = { 'nvim-tree/nvim-web-devicons', opts = true }
    },

    -- Wordcount
    {
        "https://github.com/skwee357/nvim-prose",
        config = true,
    },

    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        config = function()
            vim.cmd([[TSUpdate]])
            require('nvim-treesitter.configs').setup {
                context_commentstring = {
                    enable = true,
                    enable_autocmd = false,
                },
            }
        end
    },

    { 'nvim-treesitter/playground' },

    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    },

    {
        'gelguy/wilder.nvim',
        config = function()
            require('wilder').setup({ modes = { ':', '/', '?' } })
        end,
        dependencies = {
            'roxma/nvim-yarp',
            'roxma/vim-hug-neovim-rpc'
        }
    },

    -- File nav
    { 'theprimeagen/harpoon' },

    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    { 'mbbill/undotree' },

    {
        'numtostr/comment.nvim',
        config = function()
            require("Comment").setup {
                pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
            }
        end
    },

    {
        'JoosepAlviste/nvim-ts-context-commentstring',
        config = true
    },

    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },

    {
        'ms-jpq/coq_nvim',
        branch = 'coq',
        -- config = function()
        --     vim.cmd([[COQnow --shut-up]])
        -- end,
    },

    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'neovim/nvim-lspconfig',
            'hrsh7th/cmp-nvim-lsp',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip'
        },
        lazy = false,
    },

    { 'williamboman/mason.nvim',           lazy = false },
    { 'williamboman/mason-lspconfig.nvim', lazy = false },
    { 'neovim/nvim-lspconfig',             lazy = false },

    { 'rmagatti/goto-preview',             config = true },

    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
    },

    { 'folke/neodev.nvim',             opts = {},    dependencies = { 'neovim/nvim-lspconfig' } },

    {
        'stevearc/aerial.nvim',
        opts = {},
        -- Optional dependencies
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        },
    },

    { 'simrat39/symbols-outline.nvim', config = true },

    {
        'akinsho/toggleterm.nvim',
        version = '*',
        config = true
    },

    { 'tpope/vim-fugitive' },

    -- Debug
    { 'mfussenegger/nvim-dap' },
    {
        'rcarriga/nvim-dap-ui',
        dependencies = { 'mfussenegger/nvim-dap' },
        config = function()
            require('dapui').setup()
        end
    },
    { 'jay-babu/mason-nvim-dap.nvim' },

    { 'theprimeagen/vim-be-good' },
    { 'alec-gibson/nvim-tetris' },
    { 'eandrju/cellular-automaton.nvim' }
}
