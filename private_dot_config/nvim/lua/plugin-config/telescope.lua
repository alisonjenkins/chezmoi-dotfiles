local hastelescope, telescope = pcall(require, "telescope")

if not hastelescope then
	return
end

local previewers = require("telescope.previewers")

telescope.setup({
	defaults = {
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		},
		prompt_prefix = "❱❱ ",
		selection_caret = "❱ ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "descending",
		layout_strategy = "flex",
		layout_config = {
			horizontal = {
				mirror = false,
				height = 0.7,
			},
			vertical = {
				mirror = false,
				height = 0.7,
			},
		},
		file_sorter = require("telescope.sorters").get_fuzzy_file,
		file_ignore_patterns = {},
		generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
		path_display = { "absolute" },
		winblend = 0,
		border = {},
		borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
		color_devicons = true,
		use_less = false,
		set_env = { ["COLORTERM"] = "truecolor" }, -- default { }, currently unsupported for shells like cmd.exe / powershell.exe
		file_previewer = previewers.vim_buffer_cat.new,
		grep_previewer = previewers.vim_buffer_vimgrep.new,
		qflist_previewer = previewers.vim_buffer_qflist.new,
	},
})

local function packer_setup()
	return {
		theme = "ivy",
		layout_config = {
			height = 0.5,
		},
	}
end

local extensions = {
	dap = nil,
	fzy_native = nil,
	gh = nil,
	git_worktree = function()
		require("git-worktree").setup({})
	end,
	packer = packer_setup,
	projects = function()
		require("project_nvim").setup()
	end,
	zoxide = nil,
}

for extension, setup in pairs(extensions) do
	local hasextension, _ = pcall(require, "telescope._extensions." .. extension)

	if hasextension then
		telescope.load_extension(extension)
		if setup ~= nil then
			setup()
		end
	else
		print("Could not load telescope plugin: " .. extension .. " is it installed?")
	end
end
