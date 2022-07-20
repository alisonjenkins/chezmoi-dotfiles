local tabnine = require "cmp_tabnine.config"
tabnine:setup {
  max_lines = 1000,
  max_num_results = 20,
  run_on_every_keystroke = true,
  show_prediction_strength = false,
  snippet_placeholder = "..",
  sort = true,

  ignored_file_types = { -- default is not to ignore
    -- uncomment to ignore in lua:
    -- lua = true
  },
}
