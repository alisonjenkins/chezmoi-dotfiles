local execute = vim.api.nvim_command
local fn = vim.fn

-- automatically install packer
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    execute 'packadd packer.nvim'
end

require('packer').init({
    max_jobs = 50,
    display = {
        auto_clean = true
    }
})

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'                                                                     -- (lua) Vim Plugin manager

    if vim.fn.has("linux") then use 'nvim-telescope/telescope-media-files.nvim' end                  -- (lua) Allow previewing of media files inside Telescope (only works on Linux)
    use 'ChristianChiarulli/java-snippets'                                                           -- (-) Java snippets
    use 'JoosepAlviste/nvim-ts-context-commentstring'                                                -- (lua) Uses Treesitter to set the commentstring variable based on context. Good for embedded languages (e.g. html inside Javascript). Allows smarter commenting using nvim-comment.
    use 'ThePrimeagen/git-worktree.nvim'                                                             -- (lua) Git worktree addon for Telescope
    use 'airblade/vim-rooter'                                                                        -- (vimscript) Ensures that the current working directory is the git root
    use 'alanjjenkins/nvim-lspinstall'                                                               -- (lua) Plugin to manage installation of language server protocol servers for various programming languages.
    use 'andymass/vim-matchup'                                                                       -- (vimscript) extends vim's % key to language-specific words instead of just single characters.
    use 'brooth/far.vim'                                                                             -- (vimscript) makes it easier to find and replace text through multiple files.
    use 'dstein64/vim-startuptime'                                                                   -- (vimscript) Startup time profile viewer.
    use 'f-person/git-blame.nvim'                                                                    -- (lua) Shows Git blame text for highlighted lines as virtual text using Neovim LSP.
    use 'folke/lsp-colors.nvim'                                                                      -- (lua) Automatically creates missing LSP diagnostics highlight groups for color schemes that don't yet support the Neovim 0.5 builtin lsp client.
    use 'folke/todo-comments.nvim'                                                                   -- (lua) Easily search for Todo comments in codebases and neatly present them in the code.
    use 'gennaro-tedesco/nvim-jqx'                                                                   -- (lua) A plugin to enable easier navigation of JSON files. Require 'jq'.
    use 'glepnir/galaxyline.nvim'                                                                    -- (lua) A very fast lua statusline plugin.
    use 'glepnir/lspsaga.nvim'                                                                       -- (lua) Extension to Neovim's LSP's user interface.
    use 'godlygeek/tabular'                                                                          -- (vimscript) Allows aligning text in a Tabular fashion based on patterns in the text.
    use 'google/vim-searchindex'                                                                     -- (vimscript) Shows the number of search results for a search and what number you are current on.
    use 'hashivim/vim-terraform'                                                                     -- (vimscript) Adds a :Terraform command for running Terrafrom from Neovim, performs automatic formatting of code.
    use 'hrsh7th/nvim-compe'                                                                         -- (vimscript) A completion plugin for Neovim with support for LSP completions.
    use 'hrsh7th/vim-vsnip'                                                                          -- (vimscript) Adds support for VSCode style snippets. Means you can install and use snippets from VS Code snippet repos.
    use 'juliosueiras/vim-terraform-completion'                                                      -- (vimscript) Provides mapping for quickly opening documentation for Terraform resources.
    use 'junegunn/goyo.vim'                                                                          -- (vimscript) Focus mode to eliminate distractions when writing.
    use 'justinmk/vim-dirvish'                                                                       -- (vimscript) Replaces netrw with something much faster, designed to work with eunuch and Vim for creation of files and directories.
    use 'kevinhwang91/nvim-bqf'                                                                      -- (lua) A plugin that enhances the quickfix window with Fuzzy Finding.
    use 'kosayoda/nvim-lightbulb'                                                                    -- (lua) Shows a lightbulb on a line when a codeAction is available for it.
    use 'kshenoy/vim-signature'                                                                      -- (vimscript) Adds mark characters in the gutter.
    use 'kyazdani42/nvim-tree.lua'                                                                   -- (lua) A file drawer
    use 'kyazdani42/nvim-web-devicons'                                                               -- (lua) Adds filetype icons to many other plugins.
    use 'lewis6991/gitsigns.nvim'                                                                    -- (lua) Adds gitsigns.
    use 'liuchengxu/vista.vim'                                                                       -- (vimscript) LSP search for symbols and tags
    use 'machakann/vim-sandwich'                                                                     -- (vimscript) Adds operators and mappings for adding / deleting / changing surrounding text.
    use 'mattn/emmet-vim'                                                                            -- (vimscript) Allows writing html using abbreviations that are then expanded.
    use 'mattn/vim-gist'                                                                             -- (vimscript) A vimscript plugin for creating Github gists.
    use 'mattn/webapi-vim'                                                                           -- (vimscript) A plugin for working with webapi's using vimscript. Dependency of vim-gist.
    use 'metakirby5/codi.vim'                                                                        -- (vimscript) A scratch pad interpretter for many languages.
    use 'mfussenegger/nvim-jdtls'                                                                    -- (lua) Neovim integration for Eclipse's JDTLS Java LSP server.
    use 'mhinz/vim-startify'                                                                         -- (vimscript) Adds a startup dashboard that allows quickly opening previously opened files.
    use 'moll/vim-bbye'                                                                              -- (vimscript) Allows removing / deleting buffers without closing their windows.
    use 'monaqa/dial.nvim'                                                                           -- (lua) Upgrades Ctrl-a and Ctrl-x to increment dates, alphabet and other types in addition to just numbers
    use 'nanotee/nvim-lua-guide'                                                                     -- (-) Adds Neovim Lua documentation to Noevim's help system.
    use 'neovim/nvim-lspconfig'                                                                      -- (lua) Configurations for various language's LSP servers.
    use 'norcalli/nvim-colorizer.lua'                                                                -- (lua) A plugin to allow previewing of html/css colour codes inside Neovim.
    use 'norcalli/nvim_utils'                                                                        -- (lua) Adds Neovim Lua shortcuts and extra functionality.
    use 'nvim-lua/plenary.nvim'                                                                      -- (lua) A library of Lua code used by many Neovim lua plugins.
    use 'nvim-lua/popup.nvim'                                                                        -- (lua) A implementation of the Vim popup API in Neovim. Dependency of telescope.
    use 'nvim-telescope/telescope-frecency.nvim'                                                     -- (lua) Sorts telescope results via frecency
    use 'nvim-telescope/telescope-github.nvim'                                                       -- (lua) Github CLI integration for Telescope.
    use 'nvim-telescope/telescope-project.nvim'                                                      -- (lua) Adds the ability to add git projects to Telescope and immediately switch to them using it's fuzzy finding.
    use 'nvim-telescope/telescope-z.nvim'                                                            -- (lua) A Telescope plugin which allows quickly switching directory using z.
    use 'nvim-telescope/telescope.nvim'                                                              -- (lua) a extendable fuzzy finder for searching over lists.
    use 'nvim-treesitter/nvim-treesitter-refactor'                                                   -- (lua) A refactor of Neovim Treesitter's Highlight definitions, Highlight current scope, Smart rename and Navigation features.
    use 'nvim-treesitter/playground'                                                                 -- (lua) View Treesitter information inside Neovim.
    use 'onsails/lspkind-nvim'                                                                       -- (lua) Adds icons for the kinds of LSP autocompletions in the completion menu.
    use 'p00f/nvim-ts-rainbow'                                                                       -- (lua) Rainbowification of braces using Treesitter. Good for identifying which brace pairs with which.
    use 'phaazon/hop.nvim'                                                                           -- (lua) Adds motions that can be used to 'hop' to locations within the file. HopWord 's' and 'S'
    use 'pwntester/octo.nvim'                                                                        -- (lua) Plugin to work with Github issues and PRs from inside Neovim.
    use 'rafamadriz/friendly-snippets'                                                               -- (-) A snippet collection for many different programming languages.
    use 'rhysd/committia.vim'                                                                        -- (vimscript) Plugin improve the git commit interface showing diffs to remind you want you are changing.
    use 'rhysd/git-messenger.vim'                                                                    -- (lua) Git messenger allows looking at the commits that previous changed a line along with diffs.
    use 'sainnhe/gruvbox-material'                                                                   -- (-) A meterial design version of Gruvbox
    use 'sheerun/vim-polyglot'                                                                       -- (vimscript) Adds filetype plugins for syntax highlighting of many different filetypes.
    use 'shumphrey/fugitive-gitlab.vim'                                                              -- (vimscript) Adds Fugitive Gbrowse support for Gitlab repos.
    use 'tami5/sql.nvim'                                                                             -- (lua) Plugin to allow usage of SQLite from within Neovim and Neovim plugins.
    use 'terrortylor/nvim-comment'                                                                   -- (lua) Adds commands and mappings for commenting and uncommenting lines of code using the language's comment string.
    use 'thosakwe/vim-flutter'                                                                       -- (lua) Vim commands for Flutter including hot reload on save and more.
    use 'tommcdo/vim-fubitive'                                                                       -- (vimscript) Adds Fugitive Gbrowse support for Bitbucket repos.
    use 'tpope/vim-characterize'                                                                     -- (vimscript) Extends the Vim default 'ga' for showing the ascii code for a character to also show the Unicode, Vim Digraphs, Emoji codes and HTML entities for that character.
    use 'tpope/vim-eunuch'                                                                           -- (vimscript) Adds file and directory manipulation commands to Vim.
    use 'tpope/vim-fugitive'                                                                         -- (vimscript) Git integration for Neovim.
    use 'tpope/vim-repeat'                                                                           -- (vimscript) Makes many things that are not normally repeatable with '.' repeatable.
    use 'tpope/vim-rhubarb'                                                                          -- (vimscript) Adds Fugitive Gbrowse support for GitHub repos.
    use 'tpope/vim-sensible'                                                                         -- Sensible default options for Neovim
    use 'tpope/vim-unimpaired'                                                                       -- (vimscript) Adds many common sense mappings for working with buffers, quickfix, lines, SCM conflict markers, etc
    use 'tpope/vim-vinegar'                                                                          -- (vimscript) Adds a shortcut (-) for opening Netrw for browsing files.
    use 'turbio/bracey.vim'                                                                          -- (vimscript) A plugin for live HTML, Javascript and CSS editing.
    use 'unblevable/quick-scope'                                                                     -- (vimscript) Provides an overlay when using the 'f', 'F', 't' and 'T' motions to help with jumping to characters.
    use 'vim-scripts/Align'                                                                          -- (vimscript) Allows aligning sections of text (for example these comments in this plugin file (use visual to select the text and do :Align -- <CR>))
    use 'voldikss/vim-floaterm'                                                                      -- (vimscript) Allows opening terminal's using Nvim's floating windows.
    use 'windwp/nvim-ts-autotag'                                                                     -- (lua) Plugin for automatically closing and renaming html tags. Uses Treesitter.
    use {'glacambre/firenvim', run = function() vim.fn['firenvim#install'](1) end}                   -- (vimscript) Allows using Neovim to edit input boxes in browsers via a browser plugin.
    use {'iamcco/markdown-preview.nvim', run = 'cd app && npm install'}                              -- (vimscript) Allow previewing markdown with syncronised scrolling in a browser.
    use {'lukas-reineke/indent-blankline.nvim', branch = 'lua'}                                      -- (vimscript) Adds indentline indentation lines to blank lines in addition to lines with code on.
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }                                  -- (C) A C port of fzf that can be used to accelerate Telescope
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}                                       -- (lua) Treesitter integration for Neovim.

    -- (lua) A nice colour scheme written in Lua with support for many Treesitter features.
    use {'folke/tokyonight.nvim',
        config = function()
            vim.g.tokyonight_style = "night"
            vim.g.tokyonight_italic_functions = true
            vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
        end
    }
    -- pretty list of lsp errors.
    use {
        'folke/lsp-trouble.nvim',
        config = function()
            require("trouble").setup {
                height = 15, -- height of the trouble list
                icons = true, -- use dev-icons for filenames
                mode = "workspace", -- "workspace" or "document"
                fold_open = "", -- icon used for open folds
                fold_closed = "", -- icon used for closed folds
                action_keys = { -- key mappings for actions in the trouble list
                    close = "q", -- close the list
                    cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
                    refresh = "r", -- manually refresh
                    jump = {"<cr>", "<tab>"}, -- jump to the diagnostic or open / close folds
                    jump_close = {"o"}, -- jump to the diagnostic and close the list
                    hover = "K", -- opens a small poup with the full multiline message
                    toggle_mode = "m", -- toggle between "workspace" and "document" mode
                    toggle_preview = "P", -- toggle auto_preview
                    preview = "p", -- preview the diagnostic location
                    close_folds = {"zM", "zm"}, -- close all folds
                    open_folds = {"zR", "zr"}, -- open all folds
                    toggle_fold = {"zA", "za"}, -- toggle fold of current file
                    previous = "k", -- preview item
                    next = "j" -- next item
                },
                indent_lines = true, -- add an indent guide below the fold icons
                auto_open = false, -- automatically open the list when you have diagnostics
                auto_close = false, -- automatically close the list when you have no diagnostics
                auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back
                auto_fold = false, -- automatically fold a file trouble list at creation
                signs = {
                    -- icons / text used for a diagnostic
                    error = "",
                    warning = "",
                    hint = "",
                    information = ""
                },
                use_lsp_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
            }
        end
    }

    use {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {
                plugins = {
                    marks = true, -- shows a list of your marks on ' and `
                    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
                    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
                    -- No actual key bindings are created
                    spelling = {
                        enabled = true,
                        suggestions = 20,
                    },
                    presets = {
                        operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
                        motions = true, -- adds help for motions
                        text_objects = true, -- help for text objects triggered after entering an operator
                        windows = true, -- default bindings on <c-w>
                        nav = true, -- misc bindings to work with windows
                        z = true, -- bindings for folds, spelling and others prefixed with z
                        g = true, -- bindings for prefixed with g
                    },
                },
                -- add operators that will trigger motion and text object completion
                -- to enable all native operators, set the preset / operators plugin above
                operators = { gc = "Comments" },
                icons = {
                    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
                    separator = "➜", -- symbol used between a key and it's label
                    group = "+", -- symbol prepended to a group
                },
                window = {
                    border = "none", -- none, single, double, shadow
                    position = "bottom", -- bottom, top
                    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
                    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
                },
                layout = {
                    height = { min = 4, max = 25 }, -- min and max height of the columns
                    width = { min = 20, max = 50 }, -- min and max width of the columns
                    spacing = 3, -- spacing between columns
                },
                hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
                show_help = true -- show help message on the command line when the popup is visible
            }
        end
    }
end)

