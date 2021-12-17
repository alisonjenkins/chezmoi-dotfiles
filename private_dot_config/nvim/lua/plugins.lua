-- vim: set foldmethod=marker foldlevel=0:
local packer_installed, packer = pcall(require, "packer")
local use = packer.use

local function bootstrap_packer()--{{{
        local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
        if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
                vim.fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
                vim.cmd("packadd packer.nvim")
        end
end--}}}

local function get_plugin_config(name)--{{{
        return string.format("require(\"plugin-config/%s\")", name)
end--}}}

if not packer_installed then--{{{
        bootstrap_packer()
        local packer_installed, packer = pcall(require, "packer")
end--}}}

packer.init({--{{{
        display = {
                open_cmd = "leftabove 80vnew [packer]",
                header_sym = "─",
        },
        profile = {
                enable = true,
                threshold = 1,
        },
})--}}}

packer.startup(function()

        -- Packer self update{{{
        use({"wbthomason/packer.nvim"})--}}}
        -- Lua caching{{{
        use({"lewis6991/impatient.nvim"})--}}}
        -- Key mapping{{{
        use({"folke/which-key.nvim", event = "VimEnter", config = get_plugin_config("which-key")})--}}}
        -- File manager{{{
        use({"justinmk/vim-dirvish"}) --}}}
        -- Colour schemes{{{
        use({"folke/tokyonight.nvim", config = get_plugin_config("tokyonight")})--}}}
        -- Commenting{{{
        use({"numToStr/Comment.nvim", config = get_plugin_config("comment")})--}}}
        -- Completion{{{
        use({
                'ms-jpq/coq_nvim', 
                branch = 'coq',
                requires = {
                        { 'ms-jpq/coq.artifacts', branch = 'artifacts' },
                        { 'ms-jpq/coq.thirdparty', branch = '3p' },
                },

        })
        -- use({ 
                -- "hrsh7th/nvim-cmp",
                -- config = get_plugin_config("cmp"),
                -- requires = {
                        -- "L3MON4D3/LuaSnip",
                        -- "f3fora/cmp-spell",
                        -- "hrsh7th/cmp-buffer",
                        -- "hrsh7th/cmp-nvim-lsp",
                        -- "hrsh7th/cmp-nvim-lua",
                        -- "hrsh7th/cmp-path",
                        -- "saadparwaiz1/cmp_luasnip",
                        -- {"tzachar/cmp-tabnine", run="./install.sh"},
                -- },
        -- })}}}
        -- Git integration{{{
        use({
                "tpope/vim-fugitive",
                requires = {
                        -- (vimscript) Plugin improve the git commit interface showing diffs to remind you want you are changing. 
                        'rhysd/committia.vim',
                        -- (vimscript) Adds Fugitive Gbrowse support for Gitlab repos.,
                        'shumphrey/fugitive-gitlab.vim',
                        -- (vimscript) Adds Fugitive Gbrowse support for Bitbucket repos.
                        'tommcdo/vim-fubitive',
                        -- (vimscript) Adds Fugitive Gbrowse support for GitHub repos.
                        'tpope/vim-rhubarb',
                }
        })
        use({
                "mattn/gist-vim",
                wants = "webapi-vim",
                requires = { "mattn/webapi-vim", opt = true },
                cmd = "Gist",
                config = get_plugin_config("gist"),
        })
        use({
                "f-person/git-blame.nvim",
                config = get_plugin_config("git-blame"),
        })
        --}}}
        -- Fuzzy finding{{{
        use({
                "nvim-telescope/telescope.nvim",
                config = get_plugin_config("telescope"),
                wants = "nvim-web-devicons",
                requires = {
                        "ThePrimeagen/git-worktree.nvim",
                        "ahmedkhalf/project.nvim",
                        "jvgrootveld/telescope-zoxide",
                        "nvim-lua/plenary.nvim",
                        "nvim-lua/popup.nvim",
                        "nvim-telescope/telescope-dap.nvim",
                        "nvim-telescope/telescope-fzy-native.nvim",
                        "nvim-telescope/telescope-github.nvim",
                        "nvim-telescope/telescope-packer.nvim",
                        {
                                "kyazdani42/nvim-web-devicons",
                                opt = true,
                        },
                },
        })
        use({
                "junegunn/fzf",
                run = function()
                        vim.fn['fzf#install']()
                end,
        })
        --}}}
        -- Language servers + LSP tools{{{
        use({
                "neovim/nvim-lspconfig",
                requires = {
                        "lspcontainers/lspcontainers.nvim",
                        "onsails/lspkind-nvim",
                        "ray-x/lsp_signature.nvim",
                        "stevearc/aerial.nvim",
                },
                config = get_plugin_config("lspconfig"),
        })
        use({
                "folke/lsp-trouble.nvim",
                wants = {"nvim-web-devicons", "nvim-lspconfig"},
                requires = {"kyazdani42/nvim-web-devicons", opt = true},
                config = get_plugin_config("trouble"),
        })
        use({
                "jose-elias-alvarez/null-ls.nvim",
                config = get_plugin_config("null-ls"),
        })
        use({
                "ray-x/go.nvim",
                config = get_plugin_config("go"),
                requires = {
                        "mfussenegger/nvim-dap",
                        "rcarriga/nvim-dap-ui",
                        "theHamsta/nvim-dap-virtual-text",
                },
        })
        --}}}
        -- Treesitter + Addons{{{
        use({
                "nvim-treesitter/nvim-treesitter",
                config = get_plugin_config("treesitter"),
                run = ":TSUpdate",
                requires = {
                        {"nvim-treesitter/nvim-treesitter-textobjects"},
                        {"p00f/nvim-ts-rainbow", opt = true},
                },
                wants = {
                        "nvim-ts-rainbow",
                },
        })--}}}
        -- Statusline{{{
        use({
                "nvim-lualine/lualine.nvim",
                config = get_plugin_config("lualine"),
        })--}}}
        -- Quickfix{{{
        use({
                'kevinhwang91/nvim-bqf',
                config = get_plugin_config("bqf"),
                ft = 'qf'
        })--}}}
        -- Surround{{{
        use({
                "blackCauldron7/surround.nvim",
                config = get_plugin_config("surround"),
        })--}}}
        -- Todo comments{{{
        use({
                "folke/todo-comments.nvim",
                 requires = "nvim-lua/plenary.nvim",
                 config = get_plugin_config("todo-comments"),
        })--}}}
        -- Alignment{{{
        -- TODO: Configure the mappings for this plugin.
        use({
                "junegunn/vim-easy-align",
        })--}}}
        -- Grammar checking{{{
        use({ "rhysd/vim-grammarous", cmd = "GrammarousCheck" })
        --}}}

end)
