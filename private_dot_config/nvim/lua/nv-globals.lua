O = {
    auto_close_tree = 0,
    auto_complete = true,
    colorscheme = 'gruvbox-material',
    relative_number = true,
    wrap_lines = true,
    scroll_off = 0,
    shell = "zsh",
    python = {
        linter = '',
        formatter = 'black',
        autoformat = false,
        isort = false,
        diagnostics = {virtual_text = true, signs = true, underline = true}
    },
    dart = {
        sdk_path = '/usr/lib/dart/bin/snapshots/analysis_server.dart.snapshot'
    },
    lua = {
        formatter = 'lua-format',
        autoformat = false,
        diagnostics = {virtual_text = true, signs = true, underline = true}
    },
    sh = {
        linter = 'shellcheck',
        formatter = 'shfmt',
        autoformat = false,
        diagnostics = {virtual_text = true, signs = true, underline = true}
    },
    tsserver = {
        linter = 'eslint',
        formatter = 'prettier',
        autoformat = false,
        diagnostics = {virtual_text = true, signs = true, underline = true}
    },
    json = {
        formatter = 'prettier',
        autoformat = false,
        diagnostics = {virtual_text = true, signs = true, underline = true}
    },
    css = {
        formatter = '',
        autoformat = false,
        virtual_text = true
    }
}

DATA_PATH = vim.fn.stdpath('data')
CACHE_PATH = vim.fn.stdpath('cache')

