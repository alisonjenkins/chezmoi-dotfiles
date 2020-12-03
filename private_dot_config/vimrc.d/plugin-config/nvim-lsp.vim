lua <<EOF
local on_attach_vim = function(client)
  require'completion'.on_attach(client)
end

-- require'lspconfig'.cmake.setup{on_attach=on_attach_vim}
-- require'lspconfig'.jedi_language_server.setup{on_attach=on_attach_vim}
-- require'lspconfig'.sqlls.setup{on_attach=on_attach_vim}
-- require'lspconfig'.vimls.setup{on_attach=on_attach_vim}
-- require'lspconfig'.cssls.setup{on_attach=on_attach_vim}
-- require'lspconfig'.ccls.setup{on_attach=on_attach_vim}
require'lspconfig'.bashls.setup{on_attach=on_attach_vim}
require'lspconfig'.codeqlls.setup{on_attach=on_attach_vim}
require'lspconfig'.dockerls.setup{on_attach=on_attach_vim}
require'lspconfig'.gopls.setup{on_attach=on_attach_vim}
require'lspconfig'.html.setup{on_attach=on_attach_vim}
require'lspconfig'.jdtls.setup{on_attach=on_attach_vim}
require'lspconfig'.jsonls.setup{on_attach=on_attach_vim}
require'lspconfig'.pyls.setup{}
require'lspconfig'.rust_analyzer.setup{on_attach=on_attach_vim}
require'lspconfig'.sumneko_lua.setup{on_attach=on_attach_vim}
require'lspconfig'.terraformls.setup{
  on_attach=on_attach_vim;
  cmd = {"terraform-ls", "serve"};
}
require'lspconfig'.yamlls.setup{on_attach=on_attach_vim}
EOF

" I either want it off, or the trigger higher | default = 1
let g:completion_trigger_keyword_length = 3

" Not Sure if I want popping Up
let g:completion_enable_auto_popup      = 1
let g:completion_enable_auto_signature  = 1
let g:completion_enable_auto_hover      = 0
let g:completion_matching_ignore_case   = 0
let g:completion_enable_snippet         = 'UltiSnips'
