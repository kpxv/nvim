return {
	-- Main colorschemes
	{
		"tiagovla/tokyodark.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme tokyodark]])
		end,
	},

	-- Other colorschemes
	{ "rose-pine/neovim", lazy = false },
	{ "catppuccin/nvim", name = 'catppuccin', lazy = false },
	{ "ellisonleao/gruvbox.nvim", lazy = false },
	{ 'AlexvZyl/nordic.nvim', lazy = false },
	{ "Shatur/neovim-ayu", lazy = false },
	{ "rebelot/kanagawa.nvim", lazy = false },
	{ "olivercederborg/poimandres.nvim", lazy = false },
	{ "water-sucks/darkrose.nvim", lazy = false },
	-- { "tiagovla/tokyodark.nvim", lazy = false },
    { "folke/tokyonight.nvim", lazy = false },

	{
		"nvim-lualine/lualine.nvim",
		lazy = false,
		dependencies = { 'nvim-tree/nvim-web-devicons', opts = true }
	},

	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

	{
		"nvim-treesitter/nvim-treesitter",
		lazy = true,
		config = function()
			vim.cmd([[TSUpdate]])
		end,
	},
	{ 'nvim-treesitter/playground' },

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
			require("Comment").setup()
		end
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
		config = function()
			vim.cmd([[COQnow --shut-up]])
		end
	},

	{ 'williamboman/mason.nvim', config = function() require('mason').setup() end },

	{ 'folke/neodev.nvim', opts = {}, dependencies = { 'neovim/nvim-lspconfig' } },

    {
        'stevearc/aerial.nvim',
        opts = {},
        -- Optional dependencies
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        },
    },

    {
		'akinsho/toggleterm.nvim',
		tag = '*',
		config = function()
			require('toggleterm').setup()
		end
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
	{ 'jay-babu/mason-nvim-dap.nvim'},

	{ 'theprimeagen/vim-be-good' },
	{ 'alec-gibson/nvim-tetris' },
	{ 'eandrju/cellular-automaton.nvim' }
}
