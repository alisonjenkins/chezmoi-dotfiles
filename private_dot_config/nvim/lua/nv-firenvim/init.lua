vim.api.nvim_exec([[
let g:firenvim_config = { 'globalSettings': { 'alt': 'all' }, 'localSettings': { '.*': { 'cmdline': 'neovim', 'content': 'text', 'priority': 0, 'selector': 'textarea', 'takeover': 'never', } } }

let fc = g:firenvim_config['localSettings']

if exists('g:started_by_firenvim')
  set guifont=Monospace\ 8
endif

au BufEnter github.com_*_TEXTAREA-id-pull-request-body.txt set filetype=markdown
]], true)
