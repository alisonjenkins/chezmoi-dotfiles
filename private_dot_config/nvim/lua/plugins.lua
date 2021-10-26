local execute = vim.api.nvim_command
local fn = vim.fn

-- automatically install packer
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    execute 'packadd packer.nvim'
end

require('packer').init(
    {
        max_jobs = 50,
        display = {
            auto_clean = true
        }
    }
)

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'                                                    -- (lua) Vim Plugin manager

    -- use {'nvim-telescope/telescope-project.nvim', config = CONFIG_TELESCOPE_PROJECT()}                                                                -- (lua) Adds the ability to add git projects to Telescope and immediately switch to them using it's fuzzy finding.
    if vim.fn.has("linux") then use {'nvim-telescope/telescope-media-files.nvim', config = CONFIG_TELESCOPE_MEDIA()} end                                 -- (lua) Allow previewing of media files inside Telescope (only works on Linux)
    use 'ChristianChiarulli/java-snippets'                                                                                                               -- (-) Java snippets
    use 'JoosepAlviste/nvim-ts-context-commentstring'                                                                                                    -- (lua) Uses Treesitter to set the commentstring variable based on context. Good for embedded languages (e.g. html inside Javascript). Allows smarter commenting using nvim-comment.
    use 'L3MON4D3/LuaSnip'                                                                                                                               -- (lua) Adds support for LSP snippets.
    use 'ThePrimeagen/git-worktree.nvim'                                                                                                                 -- (lua) Git worktree addon for Telescope
    use 'andymass/vim-matchup'                                                                                                                           -- (vimscript) extends vim's % key to language-specific words instead of just single characters.
    use 'brooth/far.vim'                                                                                                                                 -- (vimscript) makes it easier to find and replace text through multiple files.
    use 'dstein64/vim-startuptime'                                                                                                                       -- (vimscript) Startup time profile viewer.
    use 'f-person/git-blame.nvim'                                                                                                                        -- (lua) Shows Git blame text for highlighted lines as virtual text using Neovim LSP.
    use 'f3fora/cmp-spell'                                                                                                                               -- (lua) Spelling completion for nvim-cmp
    use 'folke/lsp-colors.nvim'                                                                                                                          -- (lua) Automatically creates missing LSP diagnostics highlight groups for color schemes that don't yet support the Neovim 0.5 builtin lsp client.
    use 'folke/lua-dev.nvim'                                                                                                                             -- (lua) Enhanced Lua LSP configuration and documentation.
    use 'folke/todo-comments.nvim'                                                                                                                       -- (lua) Easily search for Todo comments in codebases and neatly present them in the code.
    use 'gennaro-tedesco/nvim-jqx'                                                                                                                       -- (lua) A plugin to enable easier navigation of JSON files. Require 'jq'.
    use 'glepnir/lspsaga.nvim'                                                                                                                           -- (lua) Extension to Neovim's LSP's user interface.
    use 'godlygeek/tabular'                                                                                                                              -- (vimscript) Allows aligning text in a Tabular fashion based on patterns in the text.
    use 'google/vim-searchindex'                                                                                                                         -- (vimscript) Shows the number of search results for a search and what number you are current on.
    use 'hashivim/vim-terraform'                                                                                                                         -- (vimscript) Adds a :Terraform command for running Terrafrom from Neovim, performs automatic formatting of code.
    use 'hrsh7th/cmp-buffer'                                                                                                                             -- (lua) Buffer completion for nvim-cmp
    use 'hrsh7th/cmp-nvim-lsp'                                                                                                                           -- (lua) nvim-cmp lsp completion source
    use 'hrsh7th/cmp-path'                                                                                                                               -- (lua) Completion plugin for file paths for nvim-cmp
    use 'juliosueiras/vim-terraform-completion'                                                                                                          -- (vimscript) Provides mapping for quickly opening documentation for Terraform resources.
    use 'junegunn/goyo.vim'                                                                                                                              -- (vimscript) Focus mode to eliminate distractions when writing.
    use 'justinmk/vim-dirvish'                                                                                                                           -- (vimscript) Replaces netrw with something much faster, designed to work with eunuch and Vim for creation of files and directories.
    use 'kabouzeid/nvim-lspinstall'                                                                                                                      -- (lua) Allows easy setup of LSPs
    use 'kevinhwang91/nvim-bqf'                                                                                                                          -- (lua) A plugin that enhances the quickfix window with Fuzzy Finding.
    use 'kshenoy/vim-signature'                                                                                                                          -- (vimscript) Adds mark characters in the gutter.
    use 'kyazdani42/nvim-web-devicons'                                                                                                                   -- (lua) Adds filetype icons to many other plugins.
    use 'lambdalisue/gina.vim'                                                                                                                           -- (vimscript) Async git commands.
    use 'liuchengxu/vista.vim'                                                                                                                           -- (vimscript) LSP search for symbols and tags
    use 'machakann/vim-sandwich'                                                                                                                         -- (vimscript) Adds operators and mappings for adding / deleting / changing surrounding text.
    use 'mattn/emmet-vim'                                                                                                                                -- (vimscript) Allows writing html using abbreviations that are then expanded.
    use 'mattn/vim-gist'                                                                                                                                 -- (vimscript) A vimscript plugin for creating Github gists.
    use 'mattn/webapi-vim'                                                                                                                               -- (vimscript) A plugin for working with webapi's using vimscript. Dependency of vim-gist.
    use 'metakirby5/codi.vim'                                                                                                                            -- (vimscript) A scratch pad interpretter for many languages.
    use 'mfussenegger/nvim-jdtls'                                                                                                                        -- (lua) Neovim integration for Eclipse's JDTLS Java LSP server.
    use 'mhinz/vim-startify'                                                                                                                             -- (vimscript) Adds a startup dashboard that allows quickly opening previously opened files.
    use 'moll/vim-bbye'                                                                                                                                  -- (vimscript) Allows removing / deleting buffers without closing their windows.
    use 'nanotee/nvim-lua-guide'                                                                                                                         -- (-) Adds Neovim Lua documentation to Noevim's help system.
    use 'norcalli/nvim_utils'                                                                                                                            -- (lua) Adds Neovim Lua shortcuts and extra functionality.
    use 'nvim-lua/lsp_extensions.nvim'                                                                                                                   -- (lua) Adds line hints with Rust data types from rust-analyzer.
    use 'nvim-lua/plenary.nvim'                                                                                                                          -- (lua) A library of Lua code used by many Neovim lua plugins.
    use 'nvim-lua/popup.nvim'                                                                                                                            -- (lua) A implementation of the Vim popup API in Neovim. Dependency of telescope.
    use 'phaazon/hop.nvim'                                                                                                                               -- (lua) Adds motions that can be used to 'hop' to locations within the file. HopWord 's' and 'S'
    use 'rafamadriz/friendly-snippets'                                                                                                                   -- (-) A snippet collection for many different programming languages.
    use 'ray-x/lsp_signature.nvim'                                                                                                                       -- (lua) Uses LSP to generate Function / Class signature popups so you know what the parameters are when calling them.
    use 'rhysd/committia.vim'                                                                                                                            -- (vimscript) Plugin improve the git commit interface showing diffs to remind you want you are changing.
    use 'rhysd/git-messenger.vim'                                                                                                                        -- (lua) Git messenger allows looking at the commits that previous changed a line along with diffs.
    use 'sainnhe/gruvbox-material'                                                                                                                       -- (-) A meterial design version of Gruvbox
    use 'sheerun/vim-polyglot'                                                                                                                           -- (vimscript) Adds filetype plugins for syntax highlighting of many different filetypes.
    use 'shumphrey/fugitive-gitlab.vim'                                                                                                                  -- (vimscript) Adds Fugitive Gbrowse support for Gitlab repos.
    use 'tami5/sql.nvim'                                                                                                                                 -- (lua) Plugin to allow usage of SQLite from within Neovim and Neovim plugins.
    use 'thosakwe/vim-flutter'                                                                                                                           -- (lua) Vim commands for Flutter including hot reload on save and more.
    use 'tommcdo/vim-fubitive'                                                                                                                           -- (vimscript) Adds Fugitive Gbrowse support for Bitbucket repos.
    use 'tpope/vim-characterize'                                                                                                                         -- (vimscript) Extends the Vim default 'ga' for showing the ascii code for a character to also show the Unicode, Vim Digraphs, Emoji codes and HTML entities for that character.
    use 'tpope/vim-dispatch'                                                                                                                             -- (vimscript) Allows async compiles, async tests, etc.
    use 'tpope/vim-eunuch'                                                                                                                               -- (vimscript) Adds file and directory manipulation commands to Vim.
    use 'tpope/vim-fugitive'                                                                                                                             -- (vimscript) Git integration for Neovim.
    use 'tpope/vim-repeat'                                                                                                                               -- (vimscript) Makes many things that are not normally repeatable with '.' repeatable.
    use 'tpope/vim-rhubarb'                                                                                                                              -- (vimscript) Adds Fugitive Gbrowse support for GitHub repos.
    use 'tpope/vim-sensible'                                                                                                                             -- Sensible default options for Neovim
    use 'tpope/vim-unimpaired'                                                                                                                           -- (vimscript) Adds many common sense mappings for working with buffers, quickfix, lines, SCM conflict markers, etc
    use 'tpope/vim-vinegar'                                                                                                                              -- (vimscript) Adds a shortcut (-) for opening Netrw for browsing files.
    use 'turbio/bracey.vim'                                                                                                                              -- (vimscript) A plugin for live HTML, Javascript and CSS editing.
    use 'unblevable/quick-scope'                                                                                                                         -- (vimscript) Provides an overlay when using the 'f', 'F', 't' and 'T' motions to help with jumping to characters.
    use 'vim-scripts/Align'                                                                                                                              -- (vimscript) Allows aligning sections of text (for example these comments in this plugin file (use visual to select the text and do :Align                                          -- <CR>))
    use 'voldikss/vim-floaterm'                                                                                                                          -- (vimscript) Allows opening terminal's using Nvim's floating windows.
    use 'windwp/nvim-ts-autotag'                                                                                                                         -- (lua) Plugin for automatically closing and renaming html tags. Uses Treesitter.
    use {"ahmedkhalf/project.nvim", config = CONFIG_PROJECT() }                                                                                          -- (lua) Project management and vim-rooter replacement.
    use {'Saecki/crates.nvim', requires = { 'nvim-lua/plenary.nvim' }}                                                                                   -- (lua) A neovim plugin that helps managing crates.io dependencies.
    use {'fiatjaf/neuron.vim'}                                                                                                                           -- (lua) Neuron is a Zettelkasten management tool. This is the plugin for Vim/Neovim to integrate and view the notes.
    use {'folke/lsp-trouble.nvim', config = LSP_TROUBLE_CONFIG()}                                                                                        -- pretty list of lsp errors.
    use {'folke/tokyonight.nvim', config = TOKYONIGHT_CONFIG()}                                                                                          -- (lua) A nice colour scheme written in Lua with support for many Treesitter features.
    use {'folke/which-key.nvim', config = WHICHKEY_CONFIG()}                                                                                             -- shows mappings as you trigger them to help with remembering them.
    use {'glacambre/firenvim', run = function() vim.fn['firenvim#install'](1) end}                                                                       -- (vimscript) Allows using Neovim to edit input boxes in browsers via a browser plugin.
    use {'glepnir/galaxyline.nvim', config = CONFIG_GALAXYLINE()}                                                                                        -- (lua) A very fast lua statusline plugin.
    use {'hrsh7th/nvim-cmp', requires = { 'hrsh7th/vim-vsnip', 'hrsh7th/cmp-buffer', config = CONFIG_NVIM_CMP() }}                                       -- (lua) nvim-cmp completion plugin. This is the successor to the now deprecated nvim-compe.
    use {'iamcco/markdown-preview.nvim', run = 'cd app && npm install'}                                                                                  -- (vimscript) Allow previewing markdown with syncronised scrolling in a browser.
    use {'jvgrootveld/telescope-zoxide', config = CONFIG_TELESCOPE_ZOXIDE()}                                                                             -- (lua) A Telescope plugin which allows quickly switching directory using z.
    use {'kosayoda/nvim-lightbulb', config = CONFIG_NVIM_LIGHTBULB()}                                                                                    -- (lua) Shows a lightbulb on a line when a codeAction is available for it.
    use {'lewis6991/gitsigns.nvim', config = CONFIG_GITSIGNS()}                                                                                          -- (lua) Adds gitsigns.
    use {'lukas-reineke/indent-blankline.nvim'}                                                                                                          -- (lua) Adds indentline indentation lines to blank lines in addition to lines with code on.
    use {'mfussenegger/nvim-dap', config = CONFIG_NVIM_DAP()}                                                                                            -- (lua) Debug Adapter Protocol for Neovim
    use {'mfussenegger/nvim-dap-python'}                                                                                                                 -- (lua) Debug Adapter Protocol for Python
    use {'monaqa/dial.nvim', config = CONFIG_DIAL()}                                                                                                     -- (lua) Upgrades Ctrl-a and Ctrl-x to increment dates, alphabet and other types in addition to just numbers
    use {'neovim/nvim-lspconfig', config = CONFIG_LSPCONFIG()}                                                                                           -- (lua) Configurations for various language's LSP servers.
    use {'norcalli/nvim-colorizer.lua', config = CONFIG_COLORIZER()}                                                                                     -- (lua) A plugin to allow previewing of html/css colour codes inside Neovim.
    use {'nvim-telescope/telescope-dap.nvim', config = CONFIG_TELESCOPE_DAP()}                                                                           -- (lua) Telescope interface for Debug Adapter Protocol
    use {'nvim-telescope/telescope-frecency.nvim', config = CONFIG_TELESCOPE_FRECENCY()}                                                                 -- (lua) Sorts telescope results via frecency
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}                                                                                       -- (C) A C port of fzf that can be used to accelerate Telescope
    use {'nvim-telescope/telescope-github.nvim', config = CONFIG_TELESCOPE_GITHUB()}                                                                     -- (lua) Github CLI integration for Telescope.
    use {'nvim-telescope/telescope.nvim', config = CONFIG_TELESCOPE()}                                                                                   -- (lua) a extendable fuzzy finder for searching over lists.
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = CONFIG_TREESITTER()}                                                             -- (lua) Treesitter integration for Neovim.
    use {'nvim-treesitter/nvim-treesitter-refactor', config = CONFIG_TREESITTER_REFACTOR()}                                                              -- (lua) A refactor of Neovim Treesitter's Highlight definitions, Highlight current scope, Smart rename and Navigation features.
    use {'nvim-treesitter/playground'}                                                                                                                   -- (lua) View Treesitter information inside Neovim.
    use {'onsails/lspkind-nvim', config = CONFIG_LSPKIND()}                                                                                              -- (lua) Adds icons for the kinds of LSP autocompletions in the completion menu.
    use {'pwntester/octo.nvim', config=function() require"octo".setup() end}                                                                             -- (lua) Plugin to work with Github issues and PRs from inside Neovim.
    use {'ray-x/navigator.lua', requires = {'ray-x/guihua.lua', run = 'cd lua/fzy && make'}}                                                             -- (lua) Code navigation enhancements
    use {'ruifm/gitlinker.nvim', config = function() require("gitlinker").setup({mappings = nil}) end}                                                   -- (lua) Adds the ability to copy links to lines / blocks of code in git into your clipboard using <leader>gy
    use {'simrat39/rust-tools.nvim'}                                                                                                                     -- (lua) Extra rust tools for writing applications in neovim using the native lsp. This plugin adds extra functionality over rust analyzer.
    use {'terrortylor/nvim-comment', config = CONFIG_NVIM_COMMENT()}                                                                                     -- (lua) Adds commands and mappings for commenting and uncommenting lines of code using the language's comment string.
    use {'theHamsta/nvim-dap-virtual-text'}                                                                                                              -- (lua) Debug Adapter Protocol virtual text to show the contents of variables.
    use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}                                                                       -- (lua) Tabnine AI powered auto completion.
    use({'jameshiew/nvim-magic', config = function() require('nvim-magic').setup() end, requires = { 'nvim-lua/plenary.nvim', 'MunifTanjim/nui.nvim' }}) -- OpenAI powered autocompletion.
end)

