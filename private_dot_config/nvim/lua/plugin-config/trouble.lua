local options = {
	auto_close = false, -- automatically close the list when you have no diagnostics
	auto_open = false, -- automatically open the list when you have diagnostics
	auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back
	fold_closed = "", -- icon used for closed folds
	fold_open = "", -- icon used for open folds
	height = 7, -- height of the trouble list
	icons = true, -- use dev-icons for filenames
	indent_lines = true, -- add an indent guide below the fold icons
	mode = "document_diagnostics", -- "workspace" or "document"
	use_lsp_diagnostic_signs = false, -- enabling this will use the signs defined in your lsp client

	action_keys = { -- key mappings for actions in the trouble list
		close = "<Leader>d", -- close the list
		refresh = "r", -- manually refresh
		jump = "<cr>", -- jump to the diagnostic or open / close folds
		toggle_mode = "m", -- toggle between "workspace" and "document" mode
		toggle_preview = "P", -- toggle auto_preview
		preview = "p", -- preview the diagnostic location
		close_folds = "zM", -- close all folds
		cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
		open_folds = "zR", -- open all folds
		previous = "k", -- preview item
		next = "j", -- next item
	},
	signs = {
		-- icons / text used for a diagnostic
		error = "",
		warning = "",
		hint = "",
		information = "",
	},
}

local trouble = require("trouble")
trouble.setup(options)
