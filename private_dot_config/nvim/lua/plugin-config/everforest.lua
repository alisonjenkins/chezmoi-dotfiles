vim.g.everforest_background = "soft"
vim.g.everforest_better_performance = true
vim.g.everforest_diagnostic_text_highlight = true
vim.g.everforest_transparent_background = true

vim.cmd([[
try
colorscheme everforest
catch
colorscheme desert
endtry
]])
