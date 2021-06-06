local utils = require('nv-utils')
local auto_formatters = {}

utils.define_augroups({
    _general_settings = {
        {'TextYankPost', '*', 'lua require(\'vim.highlight\').on_yank({higroup = \'Search\', timeout = 200})'},
        {'BufWinEnter', '*', 'setlocal formatoptions-=c formatoptions-=r formatoptions-=o'},
        {'BufRead', '*', 'setlocal formatoptions-=c formatoptions-=r formatoptions-=o'},
        {'BufNewFile', '*', 'setlocal formatoptions-=c formatoptions-=r formatoptions-=o'}
    },
    -- _java = {
    -- {'FileType', 'java', 'luafile ~/.config/nvim/lua/lsp/java-ls.lua'},
    -- {'FileType', 'java', 'nnoremap ca <Cmd>lua require(\'jdtls\').code_action()<CR>'}
    -- },
    _markdown = {
        {'FileType', 'markdown', 'setlocal wrap'},
        {'FileType', 'markdown', 'setlocal spell'}
    },
    _solidity = {
        {'BufWinEnter', '.sol', 'setlocal filetype=solidity'},
        {'BufRead', '*.sol', 'setlocal filetype=solidity'},
        {'BufNewFile', '*.sol', 'setlocal filetype=solidity'}
    },
    _zsh_vi_mode_command_editing = {
        {'BufWinEnter', '/tmp/zvm*', 'setlocal filetype=sh'},
        {'BufRead', '/tmp/zvm*', 'setlocal filetype=sh'},
        {'BufNewFile', '/tmp/zvm*', 'setlocal filetype=sh'}
    },
    _auto_formatters = auto_formatters
})
