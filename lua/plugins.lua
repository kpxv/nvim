return {
	-- Active colorscheme
	{
		"rebelot/kanagawa.nvim",
		config = function() vim.cmd.colorscheme("kanagawa") end,
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
			local lspconfig = require("lspconfig")
			lspconfig.pyright.setup({})
			lspconfig.ruff.setup({})
			lspconfig.clangd.setup({})
			lspconfig.lua_ls.setup({})
			lspconfig.bashls.setup({})
			lspconfig.ltex_plus.setup({})
			-- lspconfig.jdtls.setup({})
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
	},

	{
		'saghen/blink.cmp',
		dependencies = {
			"rafamadriz/friendly-snippets",
			"folke/lazydev.nvim",
			"Kaiser-Yang/blink-cmp-dictionary",
			"L3MON4D3/LuaSnip",
		},
		version = '*',
		opts = {
			completion = { list = { selection = { preselect = false, auto_insert = true } } },
			snippets = { preset = 'luasnip' },
			keymap = {
				preset = 'none',
				["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
				["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
				["<C-CR>"] = { "accept" },
			},
			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = 'mono'
			},
			sources = {
				default = { 'dictionary', 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
					dictionary = {
						module = 'blink-cmp-dictionary',
						name = 'Dict',
						min_keyword_length = 3,
						max_items = 8,
						opts = {
							dictionary_files = function()
								if vim.bo.filetype == 'lilypond' then -- Add lilypond words to sources
									return vim.fn.glob(vim.fn.expand('$LILYDICTPATH') .. '/*', true, true)
								end
							end,
						}
					},
				},
			},
		},
		opts_extend = { "sources.default" },
		event = "VeryLazy",
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
}
