require'lspconfig'.yamlls.setup {
  settings = {
    yaml = {
      schemas = { kubernetes = "*.y?ml" },
    }
  }
}
