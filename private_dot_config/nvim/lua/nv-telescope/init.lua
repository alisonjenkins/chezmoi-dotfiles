function CONFIG_TELESCOPE()
        local hastelescope, _ = pcall(require,"telescope")

        if not hastelescope then
                return
        end

        local actions = require('telescope.actions')

        require('telescope').setup {
                defaults = {
                        vimgrep_arguments     = {'rg', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case'},
                        prompt_prefix         = " ",
                        selection_caret       = " ",
                        entry_prefix          = "  ",
                        initial_mode          = "insert",
                        selection_strategy    = "reset",
                        sorting_strategy      = "descending",
                        layout_strategy       = "horizontal",
                        file_sorter           = require'telescope.sorters'.get_fuzzy_file,
                        file_ignore_patterns  = {},
                        generic_sorter        = require'telescope.sorters'.get_generic_fuzzy_sorter,
                        path_display          = { "absolute" },
                        winblend              = 0,
                        border                = {},
                        borderchars           = {'─', '│', '─', '│', '╭', '╮', '╯', '╰'},
                        color_devicons        = true,
                        use_less              = true,
                        set_env               = {['COLORTERM'] = 'truecolor'}, -- default = nil,
                        file_previewer        = require'telescope.previewers'.vim_buffer_cat.new,
                        grep_previewer        = require'telescope.previewers'.vim_buffer_vimgrep.new,
                        qflist_previewer      = require'telescope.previewers'.vim_buffer_qflist.new,

                        -- Developer configurations: Not meant for general override
                        buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,
                        mappings = {
                                i = {
                                        ["<C-j>"] = actions.move_selection_next,
                                        ["<C-k>"] = actions.move_selection_previous,
                                        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                                        -- To disable a keymap, put [map] = false
                                        -- So, to not map "<C-n>", just put
                                        -- ["<c-x>"] = false,

                                        -- Otherwise, just set the mapping to the function that you want it to be.
                                        -- ["<C-i>"] = actions.select_horizontal,

                                        -- Add up multiple actions
                                        ["<CR>"] = actions.select_default + actions.center

                                        -- You can perform as many actions in a row as you like
                                        -- ["<CR>"] = actions.select_default + actions.center + my_cool_custom_action,
                                },
                                n = {
                                        ["<C-j>"] = actions.move_selection_next,
                                        ["<C-k>"] = actions.move_selection_previous,
                                        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                                        -- ["<C-i>"] = my_cool_custom_action,
                                }
                        }
                },
                extensions = {
                        media_files = {
                                -- filetypes whitelist
                                -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
                                filetypes = {"png", "webp", "jpg", "jpeg"},
                                find_cmd = "rg" -- find command (defaults to `fd`)
                        },
                        fzf = {
                                override_generic_sorter = false, -- override the generic sorter
                                override_file_sorter = true,     -- override the file sorter
                                case_mode = "smart_case"        -- or "ignore_case" or "respect_case"
                                -- the default case_mode is "smart_case"
                        }
                }
        }
end

function CONFIG_TELESCOPE_FRECENCY()
        local hastelescope, _ = pcall(require,"telescope")

        if not hastelescope then
                return
        end

        require('telescope').load_extension('frecency')
end

function CONFIG_TELESCOPE_FZF()
        local hastelescope, _ = pcall(require,"telescope")

        if not hastelescope then
                return
        end

        require('telescope').load_extension('fzf')
end

function CONFIG_TELESCOPE_GITHUB()
        local hastelescope, _ = pcall(require,"telescope")

        if not hastelescope then
                return
        end

        require('telescope').load_extension('gh')
end

function CONFIG_TELESCOPE_MEDIA()
        local hastelescope, _ = pcall(require,"telescope")

        if not hastelescope then
                return
        end

        require('telescope').load_extension('media_files')
end

function CONFIG_TELESCOPE_PROJECT()
        local hastelescope, _ = pcall(require,"telescope")

        if not hastelescope then
                return
        end

        require('telescope').load_extension('project')
end

function CONFIG_TELESCOPE_ZOXIDE()
        local hastelescope, _ = pcall(require,"telescope")

        if not hastelescope then
                return
        end

        require('telescope').load_extension('zoxide')
end

function CONFIG_TELESCOPE_DAP()
        local hastelescope, _ = pcall(require,"telescope")

        if not hastelescope then
                return
        end

        local hastsdap, _ = pcall(require,"dap")

        if not hastsdap then
                return
        end

        require('telescope').load_extension('dap')
end
