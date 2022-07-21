local hastelescope, telescope = pcall(require, "telescope")

if not hastelescope then
  return
end

local previewers = require "telescope.previewers"

telescope.setup {
  defaults = {
    border = {},
    borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    color_devicons = true,
    file_ignore_patterns = {},
    file_previewer = previewers.vim_buffer_cat.new,
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    grep_previewer = previewers.vim_buffer_vimgrep.new,
    initial_mode = "insert",
    layout_strategy = "flex",
    path_display = { "absolute" },
    prompt_prefix = "❱❱ ",
    qflist_previewer = previewers.vim_buffer_qflist.new,
    selection_caret = "❱ ",
    selection_strategy = "reset",
    set_env = { ["COLORTERM"] = "truecolor" }, -- default { }, currently unsupported for shells like cmd.exe / powershell.exe
    sorting_strategy = "descending",
    use_less = false,
    winblend = 0,

    layout_config = {
      horizontal = {
        mirror = false,
        height = 0.9,
      },
      vertical = {
        mirror = false,
        height = 0.9,
      },
    },

    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
  },
}

local extensions = {
  dap = nil,
  file_browser = nil,
  fzy_native = nil,
  gh = nil,
  git_worktree = function()
    require("git-worktree").setup {}
  end,
  projects = function()
    require("project_nvim").setup {
      ignore_lsp = {
        "null-ls",
      },
    }
  end,
  ["ui-select"] = function()
    require("telescope.themes").get_dropdown {}
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
