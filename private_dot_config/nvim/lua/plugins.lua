local execute = vim.api.nvim_command
local fn = vim.fn

-- automatically install packer
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    execute 'packadd packer.nvim'
end

require('packer').init({display = {auto_clean = true}})

return require('packer').startup(function(use)
    if vim.fn.has("linux") then use 'nvim-telescope/telescope-media-files.nvim' end                  -- (lua) Allow previewing of media files inside Telescope (only works on Linux)
    use 'ChristianChiarulli/java-snippets'                                                           -- (-) Java snippets
    use 'JoosepAlviste/nvim-ts-context-commentstring'                                                -- (lua) Uses Treesitter to set the commentstring variable based on context. Good for embedded languages (e.g. html inside Javascript). Allows smarter commenting using nvim-comment.
    use 'bfredl/nvim-miniyank'                                                                       -- (vimscript) The killring-alike plugin with no default mappings.
    use 'brooth/far.vim'                                                                             -- (vimscript) makes it easier to find and replace text through multiple files.
    use 'gennaro-tedesco/nvim-jqx'                                                                   -- (lua) A plugin to enable easier navigation of JSON files. Require 'jq'.
    use 'glepnir/lspsaga.nvim'                                                                       -- (lua) Extension to Neovim's LSP's user interface.
    use 'hashivim/vim-terraform'                                                                     -- (vimscript) Adds a :Terraform command for running Terrafrom from Neovim, performs automatic formatting of code.
    use 'hrsh7th/vim-vsnip'                                                                          -- (vimscript) Adds support for VSCode style snippets. Means you can install and use snippets from VS Code snippet repos.
    use 'juliosueiras/vim-terraform-completion'                                                      -- (vimscript) Provides mapping for quickly opening documentation for Terraform resources.
    use 'junegunn/goyo.vim'                                                                          -- (vimscript) Focus mode to eliminate distractions when writing.
    use 'junegunn/vim-peekaboo'                                                                      -- (vimscript) Peekaboo will show you the contents of the registers on the sidebar when you hit " or @ in normal mode or <CTRL-R> in insert mode.
    -- use 'kabouzeid/nvim-lspinstall'                                                               -- (lua) Plugin to manage installation of language server protocol servers for various programming languages.
    use {'~/git/nvim-lspinstall', config = require('nv-lspinstall')}                                -- (lua) Plugin to manage installation of language server protocol servers for various programming languages.
    use 'kevinhwang91/nvim-bqf'                                                                      -- (lua) A plugin that enhances the quickfix window with Fuzzy Finding.
    use 'kshenoy/vim-signature'                                                                      -- (vimscript) Adds mark characters in the gutter.
    use 'kyazdani42/nvim-web-devicons'                                                               -- (lua) Adds filetype icons to many other plugins.
    use 'liuchengxu/vim-which-key'                                                                   -- (vimscript) Displays a mapping cheat sheet for leader.
    use 'liuchengxu/vista.vim'                                                                       -- (vimscript) LSP search for symbols and tags
    use 'machakann/vim-sandwich'                                                                     -- (vimscript) Adds operators and mappings for adding / deleting / changing surrounding text.
    use 'mattn/vim-gist'                                                                             -- (vimscript) A vimscript plugin for creating Github gists.
    use 'mattn/webapi-vim'                                                                           -- (vimscript) A plugin for working with webapi's using vimscript. Dependency of vim-gist.
    use 'metakirby5/codi.vim'                                                                        -- (vimscript) A scratch pad interpretter for many languages.
    use 'mfussenegger/nvim-jdtls'                                                                    -- (lua) Neovim integration for Eclipse's JDTLS Java LSP server.
    use 'mhinz/vim-startify'                                                                         -- (vimscript) Adds a startup dashboard that allows quickly opening previously opened files.
    use 'moll/vim-bbye'                                                                              -- (vimscript) Allows removing / deleting buffers without closing their windows.
    use 'nanotee/nvim-lua-guide'                                                                     -- (-) Adds Neovim Lua documentation to Noevim's help system.
    use 'norcalli/nvim_utils'                                                                        -- (lua) Adds Neovim Lua shortcuts and extra functionality.
    use 'nvim-lua/plenary.nvim'                                                                      -- (lua) A library of Lua code used by many Neovim lua plugins.
    use 'nvim-lua/popup.nvim'                                                                        -- (lua) A implementation of the Vim popup API in Neovim. Dependency of telescope.
    use 'nvim-telescope/telescope-project.nvim'                                                      -- (lua) Adds the ability to add git projects to Telescope and immediately switch to them using it's fuzzy finding.
    use 'nvim-treesitter/nvim-treesitter-refactor'                                                   -- (lua) A refactor of Neovim Treesitter's Highlight definitions, Highlight current scope, Smart rename and Navigation features.
    use 'nvim-treesitter/playground'                                                                 -- (lua) View Treesitter information inside Neovim.
    use 'p00f/nvim-ts-rainbow'                                                                       -- (lua) Rainbowification of braces using Treesitter. Good for identifying which brace pairs with which.
    use 'psliwka/vim-smoothie'                                                                       -- (vimscript) Makes scrolling in Vim smooth (adds a scrolling animation)
    use 'rafamadriz/friendly-snippets'                                                               -- (-) A snippet collection for many different programming languages.
    use 'sainnhe/gruvbox-material'                                                                   -- (-) A meterial design version of Gruvbox
    use 'sheerun/vim-polyglot'                                                                       -- (vimscript) Adds filetype plugins for syntax highlighting of many different filetypes.
    use 'shumphrey/fugitive-gitlab.vim'                                                              -- (vimscript) Adds Fugitive Gbrowse support for Gitlab repos.
    use 'thosakwe/vim-flutter'                                                                       -- (lua) Vim commands for Flutter including hot reload on save and more.
    use 'tommcdo/vim-fubitive'                                                                       -- (vimscript) Adds Fugitive Gbrowse support for Bitbucket repos.
    use 'tpope/vim-fugitive'                                                                         -- (vimscript) Git integration for Neovim.
    use 'tpope/vim-rhubarb'                                                                          -- (vimscript) Adds Fugitive Gbrowse support for GitHub repos.
    use 'tpope/vim-unimpaired'                                                                       -- (vimscript) Adds many common sense mappings for working with buffers, quickfix, lines, SCM conflict markers, etc
    use 'turbio/bracey.vim'                                                                          -- (vimscript) A plugin for live HTML, Javascript and CSS editing.
    use 'vim-scripts/Align'                                                                          -- (vimscript) Allows aligning sections of text (for example these comments in this plugin file (use visual to select the text and do :Align -- <CR>))
    use 'wbthomason/packer.nvim'                                                                     -- (lua) Vim Plugin manager
    use 'windwp/nvim-ts-autotag'                                                                     -- (lua) Plugin for automatically closing and renaming html tags. Uses Treesitter.
    use {'MattesGroeger/vim-bookmarks', config = require('nv-bookmark') }                           -- (vimscript) This vim plugin allows toggling bookmarks per line. A quickfix window gives access to all bookmarks. Annotations can be added as well. These are special bookmarks with a comment attached.
    use {'airblade/vim-rooter', config = require('nv-vim-rooter')}                                  -- (vimscript) Ensures that the current working directory is the git root
    use {'andymass/vim-matchup', config = require('nv-matchup') }                                   -- (vimscript) extends vim's % key to language-specific words instead of just single characters.
    use {'f-person/git-blame.nvim', config = require('nv-gitblame')}                                -- (lua) Shows Git blame text for highlighted lines as virtual text using Neovim LSP.
    use {'gennaro-tedesco/nvim-peekup', config = require('nv-nvim-peekup')}                         -- (lua) Adds menu for viewing registers and selecting registers to use when pasting. Mapped to ""
    use {'glacambre/firenvim', run = function() vim.fn['firenvim#install'](1) end}                   -- (vimscript) Allows using Neovim to edit input boxes in browsers via a browser plugin.
    use {'glepnir/galaxyline.nvim', config = require('nv-galaxyline')}                              -- (lua) A very fast lua statusline plugin.
    use {'hrsh7th/nvim-compe', config = require('nv-compe')}                                        -- (vimscript) A completion plugin for Neovim with support for LSP completions.
    use {'iamcco/markdown-preview.nvim', run = 'cd app && npm install'}                              -- (vimscript) Allow previewing markdown with syncronised scrolling in a browser.
    use {'kevinhwang91/rnvimr', config = require('nv-rnvimr')}                                      -- (vimscript) Neovim integration with ranger.
    use {'kosayoda/nvim-lightbulb', config = require('nv-lightbulb')}                               -- (lua) Shows a lightbulb on a line when a codeAction is available for it.
    use {'kyazdani42/nvim-tree.lua', config = require('nv-nvimtree')}                               -- (lua) A file drawer
    use {'lewis6991/gitsigns.nvim', config = require('nv-gitsigns')}                                -- (lua) Adds gitsigns.
    use {'lukas-reineke/indent-blankline.nvim', branch = 'lua', config = require('nv-indentline') } -- (vimscript) Adds indentline indentation lines to blank lines in addition to lines with code on.
    use {'mattn/emmet-vim', config = require('nv-emmet') }                                          -- (vimscript) Allows writing html using abbreviations that are then expanded.
    use {'monaqa/dial.nvim', config = require('nv-dial') }                                          -- (lua) Upgrades Ctrl-a and Ctrl-x to increment dates, alphabet and other types in addition to just numbers
    use {'neovim/nvim-lspconfig'}                                      -- (lua) Configurations for various language's LSP servers.
    use {'norcalli/nvim-colorizer.lua', config = require('nv-colorizer')}                           -- (lua) A plugin to allow previewing of html/css colour codes inside Neovim.
    use {'nvim-telescope/telescope.nvim', config = require('nv-telescope')}                         -- (lua) a extendable fuzzy finder for searching over lists.
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = require('nv-treesitter')}   -- (lua) Treesitter integration for Neovim.
    use {'onsails/lspkind-nvim', config = require('nv-lspkind')}                                    -- (lua) Adds icons for the kinds of LSP autocompletions in the completion menu.
    use {'phaazon/hop.nvim', config = require('nv-hop')}                                            -- (lua) Adds motions that can be used to 'hop' to locations within the file. HopWord 's' and 'S'
    use {'puremourning/vimspector', config = require('nv-vimspector')}                              -- (vimscript) Debug adapter protocol client implementation for Neovim for debugging many languages.
    use {'pwntester/octo.nvim'}                                                                      -- (lua) Plugin to work with Github issues and PRs from inside Neovim.
    use {'terrortylor/nvim-comment', config = require('nv-comment') }                               -- (lua) Adds commands and mappings for commenting and uncommenting lines of code using the language's comment string.
    use {'unblevable/quick-scope', config = require('nv-quickscope')}                               -- (vimscript) Provides an overlay when using the 'f', 'F', 't' and 'T' motions to help with jumping to characters.
    use {'voldikss/vim-floaterm', config = require('nv-floaterm') }                                 -- (vimscript) Allows opening terminal's using Nvim's floating windows.
end)

