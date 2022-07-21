local null_ls = require "null-ls"
local lSsources = {
  null_ls.builtins.formatting.shfmt,
  null_ls.builtins.formatting.terraform_fmt,
  null_ls.builtins.formatting.prettierd.with {
    filetypes = {
      "javascript",
      "typescript",
      "css",
      "scss",
      "html",
      "json",
      "yaml",
      "markdown",
      "graphql",
      "md",
      "txt",
    },
  },
  null_ls.builtins.formatting.stylua.with {
    filetypes = {
      "lua",
    },
    args = { "--indent-width", "2", "--indent-type", "Spaces", "-" },
  },
}

null_ls.setup {
  sources = lSsources,
  on_attach = function(client, _)
    if client.supports_method "textDocument/formatting" then
      require("lsp-format").on_attach(client)
    end
  end,
}
