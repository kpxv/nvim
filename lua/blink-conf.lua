return {
	appearance = {
		nerd_font_variant = 'mono',
		-- use_nvim_cmp_as_default = false,
		kind_icons = {
			Text = '[BUF]',
			Method = '[FN]',
			Function = '[FN]',
			Constructor = '[CON]',

			Field = '[FLD]',
			Variable = '[VAR]',
			Property = '[PRP]',

			Class = '[CLS]',
			Interface = '[IFCE]',
			Struct = '[STRCT]',
			Module = '[MODL]',

			Unit = '[UNIT]',
			Value = '[VAL]',
			Enum = '[ENM]',
			EnumMember = '[EMEM]',

			Keyword = '[KWD]',
			Constant = '[CNST]',

			Snippet = '[SNP]',
			Color = '[COL]',
			File = '[FIL]',
			Reference = '[REF]',
			Folder = '[FLD]',
			Event = '[EVNT]',
			Operator = '[OP]',
			TypeParameter = '[TYP]',
		},
	},

	cmdline = {
		-- enabled = true,
	},

	completion = {
		-- documentation = {
		-- 	auto_show = false,
		-- 	auto_show_delay_ms = 500,
		-- },
		-- ghost_text = {
		-- 	enabled = false,
		-- },
		keyword = {
			range = 'full',
		},
		list = {
			selection = {
				preselect = false,
				auto_insert = true,
			},
			-- auto_brackets = {
			-- 	enabled = true,
			-- },
		},
		-- menu = {
		-- 	auto_show = true,
		-- 	draw = {
		-- 		columns = {
		-- 			{ "label",     "label_description", gap = 1 },
		-- 			{ "kind_icon", "kind" },
		-- 		},
		-- 	},
		-- },
		trigger = {
			-- show_on_keyword = true,
			-- show_on_trigger_character = true,
			-- show_on_blocked_trigger_character = { ' ', '\n', '\t' },
			-- show_on_insert_on_trigger_character = true,
			-- show_on_x_blocked_trigger_characters = { "'", '"', '(', '{', '[' },
			-- show_on_accept_on_trigger_character = true,
			-- show_on_x_blocked_trigger_characters = { "'", '"', '(', '{', '[' },
			show_on_backspace_after_accept = false,
			show_on_backspace_after_insert_enter = false,
		},
	},

	fuzzy = {
		max_typos = 0,
		-- use_frecency = true,
		use_proximity = false,
	},

	keymap = {
		preset = 'none',
		["<C-N>"] = { "select_next", "fallback" },
		["<C-P>"] = { "select_prev", "fallback" },
		["<Tab>"] = { "snippet_forward", "fallback" },
		["<S-Tab>"] = { "snippet_backward", "fallback" },
		["<C-Space>"] = { "show" },
		["<C-CR>"] = { "accept" },
		["<C-c>"] = { "cancel" },
	},

	-- signature = {
	-- 	enabled = true,
	-- },

	snippets = {
		preset = 'luasnip'
	},

	sources = {
		default = { 'lilypond', 'lsp', 'path', 'snippets', 'buffer' },
		per_filetype = {
			lua = { inherit_defaults = true, 'lazydev' },
		},
		providers = {
			lsp = {
				timeout_ms = 1000,
			},
			lazydev = {
				module = "lazydev.integrations.blink",
				name = "LazyDev",
				min_keyword_length = 0,
				score_offset = 100,
			},
			lilypond = {
				module = 'blink-cmp-dictionary',
				name = nil,
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
}
