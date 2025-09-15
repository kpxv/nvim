return {
	-- Active colorscheme
	{
		"rebelot/kanagawa.nvim",
		config = function()
			vim.cmd.colorscheme("kanagawa")
		end,
		event = "VeryLazy",
	},

	-- Other colorschemes
	{ "rose-pine/neovim",                 lazy = true, name = "rose-pine", },
	{ "catppuccin/nvim",                  lazy = true, name = "catppuccin", },
	{ "AlexvZyl/nordic.nvim",             lazy = true },
	{ "tiagovla/tokyodark.nvim",          lazy = true },
	{ "projekt0n/github-nvim-theme",      lazy = true },
	{ "shaunsingh/nord.nvim",             lazy = true },
	{ "nyoom-engineering/oxocarbon.nvim", lazy = true },
	{ "dasupradyumna/midnight.nvim",      lazy = true },
	{ "folke/tokyonight.nvim",            lazy = true },
	{ "oonamo/ef-themes.nvim",            lazy = true },

	-- Better multifile marks
	{
		"theprimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function() require("harpoon"):setup() end,
		lazy = true,
	},

	-- Markdown
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.cmd [[Lazy load markdown-preview.nvim]]
			vim.fn["mkdp#util#install"]()
		end,
	},

	-- LaTeX
	{
		"lervag/vimtex",
		lazy = false,
		init = function()
			vim.g.vimtex_view_method = "zathura"
		end
	},

	-- Fuzzy finder
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			keymaps = { "none" },
			winopts = {
				border = "single",
				preview = { border = "single" },
			},
			fzf_opts = {
				["+m"] = true,
				["--cycle"] = true,
				["--no-scrollbar"] = true,
				["--bind=tab:down,btab:up"] = true,
			},
		},
		lazy = true,
	},

	-- Nicer help menu
	{
		"anuvyklack/help-vsplit.nvim",
		opts = {},
		event = "VeryLazy",
	},

	-- Undotree
	{ "mbbill/undotree",                 cmd = { "UndotreeToggle" }, },

	-- Better syntax highlighting
	{ "nvim-treesitter/nvim-treesitter", event = "VeryLazy" },

	-- Lilypond
	{
		"martineausimon/nvim-lilypond-suite",
		opts = {},
	},

	-- LSP stuff
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", opts = {} },
			{
				"brunotvs/mason-lspconfig.nvim",
				opts = {
					ensure_installed = {
						"pyright",
						"ruff",
						"clangd",
						"lua_ls",
						"bashls",
					}
				}
			},
			{ "danymat/neogen",          config = true },
		},
		config = function()
			vim.lsp.enable('pyright')
			vim.lsp.enable('ruff')
			vim.lsp.enable('clangd')
			vim.lsp.enable('lua_ls')
			vim.lsp.enable('bashls')
			vim.lsp.enable('texlab')
			-- vim.lsp.enable('jdtls')
		end,
		event = { "BufReadPost", "BufNewFile" },
	},

	-- Completion
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = { {
				path = "${3rd}/luv/library",
				words = { "vim%.uv" }
			} },
		},
	},

	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		-- build = "make install_jsregexp"
		config = function()
			require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/luasnippets/" })
			require("luasnip").config.set_config({
				enable_autosnippets = true,
				store_selection_keys = "<Tab>",
			})
		end
	},

	{
		'saghen/blink.cmp',
		dependencies = {
			-- "rafamadriz/friendly-snippets",
			"folke/lazydev.nvim",
			"Kaiser-Yang/blink-cmp-dictionary",
			"L3MON4D3/LuaSnip",
		},
		version = '*',
		opts = require("blink-conf"),
		opts_extend = { "sources.default" },
		-- event = "VeryLazy",
	},

	-- DAP
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			{
				"mfussenegger/nvim-dap",
				dependencies = {
					{ "williamboman/mason.nvim", opts = {} },
					{
						"jay-babu/mason-nvim-dap.nvim",
						opts = {
							ensure_installed = {
								"cppdbg",
								"python",
								"javadbg",
							},
							handlers = { function(config)
								require("mason-nvim-dap").default_setup(config)
							end },
						}
					},
				},
				config = function()
					vim.fn.sign_define("DapBreakpoint", {
						text = "●",
						texthl = "CursorLineNr",
						linehl = "",
						numhl = "",
					})
				end
			},
			"nvim-neotest/nvim-nio",
		},
		opts = {},
		lazy = true,
	},

	-- Java, hopefully
	{ "mfussenegger/nvim-jdtls", ft = { "java" }, },

	-- View binary files
	{
		"ArcaneSpecs/HexEditor.nvim",
		opts = {},
		cmd = { "HexToggle", "HexAssemble", "HexDump", "Hexplore" },
	},

	{
		"codethread/qmk.nvim",
		opts = {
			name = "LAYOUT_split_3x6_3",
			layout = {
				"_ x x x x x x _ _ _ x x x x x x",
				"_ x x x x x x _ _ _ x x x x x x",
				"_ x x x x x x _ _ _ x x x x x x",
				"_ _ _ _ _ x x x _ x x x _ _ _ _",
			},
		},
	},
}
