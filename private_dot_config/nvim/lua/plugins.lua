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
        })--}}}
        -- Fuzzy finding{{{
        use({ 
                "nvim-telescope/telescope.nvim",
                config = get_plugin_config("telescope"),
                wants = "nvim-web-devicons",
                requires = {
                        "ahmedkhalf/project.nvim",
                        "jvgrootveld/telescope-zoxide",
                        "nvim-lua/plenary.nvim",
                        "nvim-lua/popup.nvim",
                        "nvim-telescope/telescope-fzy-native.nvim",
                        "nvim-telescope/telescope-dap.nvim",
                        "nvim-telescope/telescope-github.nvim",
                        "ThePrimeagen/git-worktree.nvim",
                        {
                                "kyazdani42/nvim-web-devicons",
                                opt = true,
                        },
                },
        })--}}}
        -- Language servers{{{
        use({
                "neovim/nvim-lspconfig",
                requires = {
                        "lspcontainers/lspcontainers.nvim",
                        "onsails/lspkind-nvim",
                },
                config = get_plugin_config("lspconfig"),
        })
        --}}}

end)
