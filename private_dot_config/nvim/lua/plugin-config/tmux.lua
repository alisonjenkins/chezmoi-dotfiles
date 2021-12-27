require("tmux").setup({
	-- overwrite default configuration
	-- here, e.g. to enable default bindings
	copy_sync = {
		-- enables copy sync and overwrites all register actions to
		-- sync registers *, +, unnamed, and 0 till 9 from tmux in advance
		enable = false,
	},
	navigation = {
		-- enables default keybindings (C-hjkl) for normal mode
		enable_default_keybindings = true,

		-- cycles to opposite pane while navigating into the border
		cycle_navigation = true,

		-- prevents unzoom tmux when navigating beyond vim border
		persist_zoom = true,
	},
	resize = {
		-- enables default keybindings (A-hjkl) for normal mode
		enable_default_keybindings = true,
	},
})
