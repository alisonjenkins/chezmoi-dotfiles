-- vim: set foldmethod=marker foldlevel=0:
local packer_installed, packer = pcall(require, "packer")
local use = packer.use

local function bootstrap_packer() --{{{
	local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
		vim.fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd("packadd packer.nvim")
	end
end --}}}

local function get_plugin_config(name) --{{{
	return string.format('require("plugin-config/%s")', name)
end --}}}

if not packer_installed then --{{{
	bootstrap_packer()
	_, packer = pcall(require, "packer")
end --}}}

packer.init({ --{{{
	display = {
		open_cmd = "leftabove 80vnew [packer]",
		header_sym = "─",
	},
	profile = {
		enable = true,
		threshold = 1,
	},
}) --}}}

packer.startup(function()
	-- Packer self update{{{
	use({ "wbthomason/packer.nvim" }) --}}}
	-- Lua caching{{{
	use({ "lewis6991/impatient.nvim" }) --}}}
	-- Key mapping{{{
	use({
		"folke/which-key.nvim",
		requires = {
			"aserowy/tmux.nvim",
		},
		event = "VimEnter",
		config = get_plugin_config("which-key"),
	}) --}}}
	-- File manager{{{
	use({ "justinmk/vim-dirvish" }) --}}}
	-- Colour schemes{{{
	use({ "folke/tokyonight.nvim", config = get_plugin_config("tokyonight") })
	use({ "sainnhe/everforest", config = get_plugin_config("everforest") })
	--}}}
	-- Commenting{{{
	use({ "numToStr/Comment.nvim", config = get_plugin_config("comment") }) --}}}
	-- Completion{{{
	use({
		"hrsh7th/nvim-cmp",
		config = get_plugin_config("cmp"),
		requires = {
			"L3MON4D3/LuaSnip",
			"aspeddro/cmp-pandoc.nvim",
			"f3fora/cmp-spell",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			{ "tzachar/cmp-tabnine", run = "./install.sh" },
			"hrsh7th/cmp-cmdline",
		},
	}) -- }}}
	-- Git integration{{{
	use({
		"tpope/vim-fugitive",
		requires = {
			-- (vimscript) Plugin improve the git commit interface showing diffs to remind you want you are changing.
			"rhysd/committia.vim",
			-- (vimscript) Adds Fugitive Gbrowse support for Gitlab repos.,
			"shumphrey/fugitive-gitlab.vim",
			-- (vimscript) Adds Fugitive Gbrowse support for Bitbucket repos.
			"tommcdo/vim-fubitive",
			-- (vimscript) Adds Fugitive Gbrowse support for GitHub repos.
			"tpope/vim-rhubarb",
		},
	})
	use({
		"mattn/gist-vim",
		wants = "webapi-vim",
		requires = { "mattn/webapi-vim", opt = true },
		cmd = "Gist",
		config = get_plugin_config("gist"),
	})
	use({
		"rhysd/git-messenger.vim",
		cmd = "GitMessenger",
	})
	use({
		"f-person/git-blame.nvim",
		config = get_plugin_config("git-blame"),
	})
	use({
		"lewis6991/gitsigns.nvim",
		config = get_plugin_config("gitsigns"),
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
			"crispgm/telescope-heading.nvim",
			"jvgrootveld/telescope-zoxide",
			"nvim-lua/plenary.nvim",
			"nvim-lua/popup.nvim",
			"nvim-telescope/telescope-dap.nvim",
			"nvim-telescope/telescope-fzy-native.nvim",
			"nvim-telescope/telescope-github.nvim",
			"nvim-telescope/telescope-packer.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			{
				"kyazdani42/nvim-web-devicons",
				opt = true,
			},
		},
	})
	use({
		"junegunn/fzf",
		run = function()
			vim.fn["fzf#install"]()
		end,
	})
	--}}}
	-- Language servers + LSP tools{{{
	use({
		"neovim/nvim-lspconfig",
		requires = {
			"WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",
			"folke/lua-dev.nvim",
			"onsails/lspkind-nvim",
			"ray-x/lsp_signature.nvim",
			"stevearc/aerial.nvim",
			"williamboman/nvim-lsp-installer",
			"hrsh7th/nvim-cmp",
		},
		config = get_plugin_config("lspconfig"),
	})
	use({
		"folke/lsp-trouble.nvim",
		wants = { "nvim-web-devicons", "nvim-lspconfig" },
		requires = { "kyazdani42/nvim-web-devicons" },
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
			{ "nvim-treesitter/nvim-treesitter-textobjects" },
			{ "p00f/nvim-ts-rainbow", opt = true },
		},
		wants = {
			"nvim-ts-rainbow",
		},
	}) --}}}
	-- Statusline{{{
	use({
		"nvim-lualine/lualine.nvim",
		requires = {
			"SmiteshP/nvim-gps",
		},
		config = get_plugin_config("lualine"),
	}) --}}}
	-- Quickfix{{{
	use({
		"kevinhwang91/nvim-bqf",
		config = get_plugin_config("bqf"),
		ft = "qf",
	}) --}}}
	-- Surround{{{
	use({
		"blackCauldron7/surround.nvim",
		config = get_plugin_config("surround"),
	}) --}}}
	-- Todo comments{{{
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = get_plugin_config("todo-comments"),
	}) --}}}
	-- Alignment{{{
	-- TODO: Configure the mappings for this plugin.
	use({
		"junegunn/vim-easy-align",
	}) --}}}
	-- Grammar checking{{{
	use({ "rhysd/vim-grammarous", cmd = "GrammarousCheck" })
	--}}}
	-- Highlight of use{{{
	use({ "RRethy/vim-illuminate", event = "CursorHold" }) --}}}
	-- Smooth scrolling{{{
	use({
		"karb94/neoscroll.nvim",
		keys = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-e>", "zt", "zz", "zb" },
		config = get_plugin_config("neoscroll"),
	}) --}}}
	-- Per project marks{{{
	use({
		"ThePrimeagen/harpoon",
		requires = { "nvim-lua/plenary.nvim" },
	}) --}}}
	-- Zen mode{{{
	use({
		"folke/zen-mode.nvim",
		config = get_plugin_config("zen-mode"),
	}) --}}}
	-- Twilight Highlighting (Zen mode focusing){{{
	use({
		"folke/twilight.nvim",
		config = get_plugin_config("twilight"),
	})
	--}}}
	-- Markdown previews{{{
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
		ft = { "markdown" },
		config = get_plugin_config("markdown-preview"),
	}) --}}}
	-- Unimpaired shortcuts{{{
	use({ "tpope/vim-unimpaired" }) --}}}
	-- Repeat{{{
	use({ "tpope/vim-repeat" }) --}}}
	-- nvim-dev-webicons{{{
	use({
		"kyazdani42/nvim-web-devicons",
		config = get_plugin_config("nvim-web-devicons"),
	}) --}}}
	-- Startup Dashboard{{{
	use({
		"goolord/alpha-nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
		wants = "nvim-web-devicons",
		config = function()
			require("alpha").setup(require("alpha.themes.startify").opts)
		end,
	}) --}}}
	-- Rust{{{
	use({
		"simrat39/rust-tools.nvim",
		config = get_plugin_config("rust-tools"),
	})
	use({
		"saecki/crates.nvim",
		event = { "BufRead Cargo.toml" },
		requires = { { "nvim-lua/plenary.nvim" } },
		config = get_plugin_config("crates"),
	})
	--}}}
	-- Colorizer (Colour previews for things that define colours in code){{{
	use({
		"norcalli/nvim-colorizer.lua",
		event = "BufReadPre",
		config = get_plugin_config("colorizer"),
	}) --}}}
	-- Speeddating (Allows incrementing and decrementing of dates){{{
	use({
		"tpope/vim-speeddating",
	}) --}}}
	-- GPS for statusline (to tell where you are in large structures){{{
	use({
		"SmiteshP/nvim-gps",
		config = get_plugin_config("gps"),
		requires = "nvim-treesitter/nvim-treesitter",
	}) --}}}
	-- Tmux integration {{{
	use({
		"aserowy/tmux.nvim",
		config = get_plugin_config("tmux"),
	}) --}}}
	-- Add restoration of last location in files{{{
	use({
		"ethanholz/nvim-lastplace",
		config = get_plugin_config("lastplace"),
	}) --}}}
	-- Pandoc integration {{{
	use({
		"aspeddro/pandoc.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"jbyuki/nabla.nvim", -- Optional. See Extra Features
		},
		config = get_plugin_config("pandoc"),
	})
	-- }}}
	-- Hop {{{
	use({
		"phaazon/hop.nvim",
		config = get_plugin_config("hop"),
	})
	-- }}}

	-- TODO: Configure Packer's compiled code to be cached by Lua cache
	-- TODO: Setup more lazy loading for packer
	-- TODO: Consider switching from Lightspeed to hop or get rid of both...
	-- TODO: Setup Java plugin
end)
