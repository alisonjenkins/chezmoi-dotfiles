-- vim: set foldmethod=marker foldlevel=0:
local wk = require("which-key")

wk.setup({ --{{{
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
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
}) --}}}

-- Code navigation shortcuts{{{
vim.api.nvim_set_keymap("n", "<c-]>", ":lua vim.lsp.buf.definition()<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<c-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "1gD", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "g0", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "gW", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "gd", '<cmd>lua require("telescope.builtin").lsp_definitions()<CR>', { silent = true }) --}}}

-- better window movement with Tmux integration {{{
vim.api.nvim_set_keymap("n", "<C-h>", "<cmd>lua require('tmux').move_left()<cr>", { silent = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<cmd>lua require('tmux').move_bottom()<cr>", { silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<cmd>lua require('tmux').move_top()<cr>", { silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<cmd>lua require('tmux').move_right()<cr>", { silent = true })
--}}}

-- Set leader{{{
vim.api.nvim_set_keymap("n", "<Space>", "<NOP>", { noremap = true, silent = true })
vim.g.mapleader = " " --}}}

-- Setup leader based mappings with which-key so they are documented and
-- a cheatsheet is presented when leader is activated
wk.register({
	-- Goyo maps{{{
	z = { "<cmd>Goyo 100%x100%<cr>", "Start Goyo fullscreen" },
	Z = { "<cmd>Goyo<cr>", "Toggle Goyo" }, --}}}

	-- Splitting maps (ported from the old whichkey bindings{{{
	h = { "<C-W>s", "Split horizontally" },
	v = { "<C-W>v", "Split vertically" }, --}}}

	-- Alpha maps{{{
	[";"] = { "<cmd>Alpha<cr>", "Show Alpha" }, --}}}

	-- Debug mappings{{{
	d = {
		name = "+debug",
		b = {
			name = "+breakpoint",
			b = { '<cmd>lua require"dap".toggle_breakpoint()<CR>', "DAP Toggle Breakpoint" },
			c = {
				'<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>',
				"DAP Set Conditional Breakpoint",
			},
			l = {
				'<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>',
				"DAP Log Point",
			},
		},
		c = { '<cmd>lua require"dap".continue()<CR>', "DAP Continue" },
		i = { '<cmd>lua require"dap.ui.widgets".hover()<CR>', "DAP Hover (Inspect Variable under cursor)" },
		r = {
			name = "+repl",
			r = { '<cmd>lua require"dap".repl.open()<CR>', "DAP REPL" },
			l = { '<cmd>lua require"dap".repl.run_last()<CR>', "DAP REPL Run Last" },
		},
		S = { '<cmd>lua require"dap".stop()<CR>', "DAP Stop" },
		s = {
			name = "+step",
			i = {
				'<cmd>lua require"dap".step_into()<CR>',
				"DAP Step Into",
			},
			o = {
				'<cmd>lua require"dap".step_out()<CR>',
				"DAP Step Out",
			},
			v = {
				'<cmd>lua require"dap".step_over()<CR>',
				"DAP Step Over",
			},
		},
		t = {
			name = "+telescope",
			b = { '<cmd>lua require"telescope".extensions.dap.list_breakpoints{}<CR>', "DAP Breakpoints" },
			c = { '<cmd>lua require"telescope".extensions.dap.commands{}<CR>', "DAP Commands" },
			f = { '<cmd>lua require"telescope".extensions.dap.frames{}<CR>', "DAP Frames" },
			o = { '<cmd>lua require"telescope".extensions.dap.configurations{}<CR>', "DAP Configuration" },
			v = { '<cmd>lua require"telescope".extensions.dap.variables{}<CR>', "DAP Variables" },
		},
	}, --}}}

	-- Telescope mappings{{{
	f = { "<cmd>Telescope find_files<cr>", "Find files (Telescope)" }, --}}}

	-- s is for search powered by Telescope{{{
	s = {
		name = "+search",
		["."] = {
			"<cmd>Telescope filetypes<cr>",
			"Filetypes",
		},
		D = {
			"<cmd>Telescope diagnostics<cr>",
			"Workspace Diagnostics",
		},
		M = {
			"<cmd>Telescope man_pages<cr>",
			"Man Pages",
		},
		T = {
			"<cmd>TodoTelescope<cr>",
			"Todo comments",
		},
		b = {
			"<cmd>Telescope git_branches<cr>",
			"Git Branches",
		},
		d = {
			"<cmd>Telescope diagnostics bufnr=0<cr>",
			"Document Diagnostics",
		},
		e = {
			"<cmd>Telescope frecency<cr>",
			"Frecently edited files",
		},
		f = {
			"<cmd>Telescope find_files<cr>",
			"Files",
		},
		h = {
			"<cmd>Telescope command_history<cr>",
			"Command History",
		},
		i = {
			"<cmd>Telescope media_files<cr>",
			"Media Files",
		},
		j = {
			"<cmd>JqxList<cr>",
			"List the JSON keys in the JSON file",
		},
		m = {
			"<cmd>Telescope marks<cr>",
			"Marks",
		},
		o = {
			"<cmd>Telescope vim_options<cr>",
			"Vim Options",
		},
		p = {
			"<cmd>Telescope projects<cr>",
			"Projects",
		},
		r = {
			"<cmd>Telescope registers<cr>",
			"Registers",
		},
		t = {
			"<cmd>Telescope live_grep<cr>",
			"Text",
		},
		u = {
			"<cmd>Telescope colorscheme<cr>",
			"Colorschemes",
		},
		w = {
			"<cmd>Telescope file_browser<cr>",
			"File browser",
		},
		x = {
			"<cmd>lua require'telescope.builtin'.find_files({prompt_title = '<Switch Project>', cwd = '$HOME/git'})<cr>",
			"Switch Project (file search)",
		},
		z = {
			"<cmd>lua require'telescope'.extensions.zoxide.list{}<cr>",
			"Switch directory with Z",
		},
	}, --}}}

	-- l is for Language Server Protocol (LSP){{{
	l = {
		name = "+lsp",
		A = { "<cmd>Telescope lsp_range_code_actions<cr>", "LSP Range Code Actions" },
		D = { "<cmd>Telescope diagnostics<cr>", "Workspace Diagnostics" },
		H = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help" },
		I = { "<cmd>LspInfo<cr>", "LSP Info" },
		L = { "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>", "Line Diagnostics" },
		S = { "<cmd>Telescope lsp_workspace_symbols<cr>", "Workspace Symbols" },
		T = { "<cmd>Telescope lsp_type_definitions<cr>", "Type Defintion" },
		a = { "<cmd>Telescope lsp_code_actions<cr>", "Code Action" },
		d = { "<cmd>Telescope diagnostics bufnr=0<cr>", "Document Diagnostics" },
		f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
		o = { "<cmd>AerialToggle<cr>", "Outline" },
		-- p = { "<cmd>Lspsaga preview_definition<cr>",          "Preview Definition" },
		q = { "<cmd>Telescope quickfix<cr>", "Quickfix" },
		r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
		s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
		t = {
			name = "+trouble",
			t = { "<cmd>TroubleToggle<cr>", "Toggle Trouble" },
			r = { "<cmd>TroubleRefresh<cr>", "Refresh Trouble" },
		},
		x = { "<cmd>cclose<cr>", "Close Quickfix" },
	}, --}}}

	-- Markdown Preview mappings{{{
	M = { "<cmd>MarkdownPreviewToggle<cr>", "Preview Markdown" }, --}}}

	-- Treesitter mappings{{{
	T = {
		name = "+Treesitter",
		b = { "<cmd>lua require('nvim-biscuits').toggle_biscuits()<cr>", "Toggle biscuits" },
	}, --}}}

	-- Git mappings (all start with g){{{
	g = {
		name = "+git",
		B = { "<cmd>GBrowse<cr>", "Browse" },
		a = { "<cmd>Gwrite<cr>", "Add" },
		b = { "<cmd>Gblame<cr>", "Blame" },
		c = {
			name = "+commit",
			c = { "<cmd>Git commit<cr>", "Commit" },
			a = { "<cmd>Git commit --amend<cr>", "Commit Amend" },
		},
		d = { "<cmd>Git diff<cr>", "Diff" },
		l = { "<cmd>Git log<cr>", "Log" },
		p = { "<cmd>Git push<cr>", "Push" },
		s = { "<cmd>Git<cr>", "Status" },
		t = { "<cmd>terminal gh pr create --web<cr>", "Pull request" },
		m = { "<cmd>GitMessenger<cr>", "Line commit history" },
		w = {
			name = "+git worktree",
			c = { "<cmd>lua require('modules.core.custom_functions').create_git_worktree()<cr>", "Create worktree" },
			s = { "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>", "Switch" },
		},
	}, --}}}

	-- Quickfix mappings (all start with q){{{
	q = {
		name = "+quickfix",
		t = { "<cmd>TodoQuickFix<cr>", "Todo quickfix" },
	},
	m = {
		name = "+Marks (using Harpoon)",
		m = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Create mark using Harpoon" },
		a = { "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", "Open mark 1" },
		s = { "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", "Open mark 2" },
		d = { "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", "Open mark 3" },
		f = { "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", "Open mark 4" },
		M = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Toggle marks menu" },
	}, --}}}
}, { prefix = "<leader>" })
