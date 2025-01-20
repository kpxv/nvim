return {
	-- Colorscheme
	{
		"rebelot/kanagawa.nvim",
		config = function() vim.cmd.colorscheme("kanagawa") end
	},

	{
		"theprimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function() require("harpoon"):setup() end,
		lazy = true,
	},

	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = { keymaps = { "none" } },
		lazy = true,
	},

	-- Nicer help menu
	{ "anuvyklack/help-vsplit.nvim",    opts = {}, },

	-- Better syntax highlighting
	{ "nvim-treesitter/nvim-treesitter" },

	-- LSP stuff
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", opts = {} },
			{
				"williamboman/mason-lspconfig",
				opts = {
					ensure_installed = {
						"pyright",
						"ruff",
						"clangd",
						"lua_ls",
						"jdtls",
					}
				}
			},
		},
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.pyright.setup({})
			lspconfig.ruff.setup({})
			lspconfig.clangd.setup({})
			lspconfig.lua_ls.setup({})
			lspconfig.jdtls.setup({})
		end,
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
		'saghen/blink.cmp',
		dependencies = {
			'rafamadriz/friendly-snippets',
			"folke/lazydev.nvim",
		},
		version = '*',
		opts = {
			completion = { list = { selection = { preselect = false, auto_insert = true } } },
			keymap = {
				preset = 'none',
				["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
				["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
				["<C-y>"] = { "accept" },
			},
			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = 'mono'
			},
			sources = {
				default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
				},
			},
		},
		opts_extend = { "sources.default" }
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

	-- View binary files
	{
		"ArcaneSpecs/HexEditor.nvim",
		opts = {},
		ft = { "bin", "elf", "exe" }, -- does not actually load on these files
	},
}
