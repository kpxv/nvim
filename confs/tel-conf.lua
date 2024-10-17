return {
    defaults = {
        -- Default configuration for telescope goes here:
        sorting_strategy = 'descending',
        selection_strategy = 'reset',
        scroll_strategy = 'cycle',
        layout_strategy = 'horizontal',
        layout_config = {
            bottom_pane = {
                height = 25,
                preview_cutoff = 120,
                prompt_position = "top"
            },
            center = {
                height = 0.4,
                preview_cutoff = 40,
                prompt_position = "top",
                width = 0.5
            },
            cursor = {
                height = 0.9,
                preview_cutoff = 40,
                width = 0.8
            },
            horizontal = {
                height = 0.9,
                preview_cutoff = 120,
                prompt_position = "bottom",
                width = 0.8
            },
            vertical = {
                height = 0.9,
                preview_cutoff = 40,
                prompt_position = "bottom",
                width = 0.8
            }
        },
        cycle_layout_list = { 'horizontal', 'vertical' },
        winblend = 0,
        wrap_results = false,
        prompt_prefix = '> ',
        selection_caret = '> ',
        entry_prefix = '  ',
        multi_icon = '+',
        initial_mode = 'insert',
        border = true,
        path_display = {},
        borderchars = { "w", "│", "─", "│", "╭", "╮", "╯", "╰" },
        -- get_status_text = ???
        hl_result_eol = true,
        dynamic_preview_title = false,
        results_title = 'Results',
        prompt_title = 'Prompt',

        mappings = {
            i = {
                -- map actions.which_key to <C-h> (default: <C-/>)
                -- actions.which_key shows the mappings for your picker,
                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                ["<C-h>"] = "which_key"
            }
        },

        preview = {
            check_mime_type = true,
            filesize_limit = 25,
            timeout = 250,
            -- hooks
            treesitter = true,
            msg_bg_fillchar = '/',
            hide_on_startup = false
        }

    },
    pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
        colorscheme = {
            enable_preview = true
        }
    },
    extensions = {
        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure
    },
}
