local packer_installed, packer = pcall(require, "packer")
local use = packer.use

local function bootstrap_packer()
        local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
        if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
                vim.fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
                vim.cmd("packadd packer.nvim")
        end
end

local function get_plugin_config(name)
        return string.format("require\"plugin-config/%s\"", name)
end

if not packer_installed then
        bootstrap_packer()
        local packer_installed, packer = pcall(require, "packer")
end


packer.init({
        display = {
                open_cmd = "leftabove 80vnew [packer]",
                header_sym = "─",
        },
        profile = {
                enable = true,
                threshold = 1,
        },
})

packer.startup(function()
        use({ "lewis6991/impatient.nvim" })
        use({ "wbthomason/packer.nvim" })
        use({ "folke/which-key.nvim", event = "VimEnter", config = get_plugin_config("which-key")})
        use({ "justinmk/vim-dirvish" }) 
        use({ "folke/tokyonight.nvim", config = get_plugin_config("tokyonight")} )
        use({ "numToStr/Comment.nvim", config = get_plugin_config("comment")} )


        use({ "tpope/vim-fugitive", requires = {
                -- (vimscript) Plugin improve the git commit interface showing diffs to remind you want you are changing. 
                'rhysd/committia.vim',
                -- (vimscript) Adds Fugitive Gbrowse support for Gitlab repos.,
                'shumphrey/fugitive-gitlab.vim',
                -- (vimscript) Adds Fugitive Gbrowse support for Bitbucket repos.
                'tommcdo/vim-fubitive',
                -- (vimscript) Adds Fugitive Gbrowse support for GitHub repos.
                'tpope/vim-rhubarb', }
        })

        use({ "nvim-telescope/telescope.nvim",
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
        wants = "nvim-web-devicons",
        config = get_plugin_config("telescope")} )
end)
