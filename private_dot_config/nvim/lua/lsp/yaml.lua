local yamlls_binary = vim.fn.stdpath('data') .. "/lspinstall/yaml" .. "/node_modules/yaml-language-server/bin/yaml-language-server"
require'nvim_lsp'.yamlls.setup{
  cmd = {yamlls_binary, "--stdio"},
  settings = {
    yaml = {
      schemas = {
        ['http://json.schemastore.org/ansible-stable-2.9'] = 'roles/tasks/*.{yml,yaml}',
        ['http://json.schemastore.org/circleciconfig'] = '.circleci/**/*.{yml,yaml}',
        ['http://json.schemastore.org/github-action'] = '.github/action.{yml,yaml}',
        ['http://json.schemastore.org/github-workflow'] = '.github/workflows/*.{yml,yaml}',
        ['http://json.schemastore.org/prettierrc'] = '.prettierrc.{yml,yaml}',
        ['http://json.schemastore.org/stylelintrc'] = '.stylelintrc.{yml,yaml}',
        ['https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.20.5-standalone-strict/all.json'] = '/*',
      }
    }
  }
}
