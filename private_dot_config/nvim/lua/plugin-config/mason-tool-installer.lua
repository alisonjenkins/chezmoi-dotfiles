require("mason-tool-installer").setup {
  -- a list of all tools you want to ensure are installed upon
  -- start; they should be the names Mason uses for each tool
  ensure_installed = {
    "awk-language-server",
    "bash-language-server",
    "black", -- black is a Python code formatter
    "chrome-debug-adapter", -- Implements the debug adapter protocol for Google Chrome.
    "clangd", -- clangd is a C/C++ language server
    "cmake-language-server",
    "codelldb",
    "codeql",
    "cpplint",
    "cpptools",
    "cspell", -- cspell is a spell checker for code
    "css-lsp",
    "cssmodules-language-server",
    "cucumber-language-server", -- Cucumber language server is a language server for the Cucumber Behaviour Driven Development language.
    "debugpy", -- debugpy is a Python debugger
    "delve", -- delve is a Go debugger
    -- "dhall-lsp", -- dhall-lsp is a Dhall language server
    "diagnostic-languageserver", -- diagnostic-languageserver is the
    "djlint", -- djlint is a linter and formatter for html and various other languages
    "dockerfile-language-server",
    "dot-language-server", -- dot language server is a language server for the dot language used by Graphviz.
    "editorconfig-checker", -- editorconfig-checker is used to ensure that the files you create obey the configuration in the .editorconfig file in the repository.
    "emmet-ls", -- emmet-ls is a language server for the Emmet HTML/CSS/JavaScript extension for rapidly creating code.
    "esbonio", -- Esbonio aims to make it easier to work with reStructuredText tools such as Sphinx by providing a Language Server to enhance your editing experience. The Esbonio project is made up from a number of sub-projects.
    "eslint-lsp", -- eslint-lsp is a LSP server for the ESLint tool used for linting Javascript code.
    "eslint_d", -- speeds up eslint.
    -- "firefox-debug-adapter", -- Implements the debug adapter protocol for Firefox.
    "flux-lsp", -- flux-lsp is a language server for the Flux language which is used for querying InfluxDB and other database servers.
    "go-debug-adapter", -- Implements the debug adapter protocol for Go using the Delve debugger.
    "gofumpt", -- gofumpt is a Go formatter that can be used to format Go code. It is a stricter version of go fmt.
    "golangci-lint", -- golangci-lint is a fast Go linters runner. It runs linters in parallel, uses caching, supports yaml config, has integrations with all major IDE and has dozens of linters included.
    "golangci-lint-langserver", -- Implements a language server using golangci-lint to run lots of linters against your code as your write it.
    "golines", -- golines is a tool that automatically reworks long lines of codes to make them shorter. This catches things that gofmt does not.
    "gomodifytags", -- Go tool to modify/update field tags in structs.
    "gopls", -- gopls (pronounced "Go please") is the official Go language server developed by the Go team.
    "gotests", -- gotests makes writing Go tests easy. It's a Golang commandline tool that generates table driven tests based on its target source files' function and method signatures. Any new dependencies in the test files are automatically imported.
    "grammarly-languageserver", -- A language server implementation on top of Grammarly's SDK.
    "graphql-language-service-cli", -- Language server protocol implementation for the GraphQL Language.
    "groovy-language-server",
    "html-lsp",
    "impl", -- impl generates method stubs for implementing an interface.
    "isort", -- sorts Python imports automatically.
    "jdtls", -- Java language server protocol server implementation from Eclipse.
    "jedi-language-server", -- A language server implementation for Jedi which is an awesome autocompletion, static analysis and refactoring library for Python
    "json-lsp", -- json-lsp is a LSP server for the JSON language.
    "json-to-struct", -- json-to-struct attempts to generate go struct definitions from json documents
    "jsonnet-language-server",
    "lemminx", -- LemMinX is a XML language specific implementation of the Language Server Protocol and can be used with any editor that supports the protocol, to offer good support for the XML Language.
    "lemmy-help", -- lemmy-help is a emmylua parser as well as a CLI which takes that parsed tree and converts it into vim help docs.
    "ltex-ls", -- LTEX LS (LTEX Language Server) implements a language server according to the Language Server Protocol (LSP) and provides grammar and spelling errors in markup documents (LATEX, Markdown, etc.). The documents are checked with LanguageTool.
    "lua-language-server",
    "luacheck", -- Luacheck is a static analyzer and a linter for Lua.
    "marksman", -- Marksman is an LSP server for Markdown that provides completion, goto definition, find references, diagnostics, etc.
    -- "metamath-zero-lsp", --
    -- "misspell", -- Misspell is a spell checker for English.
    -- "mockdebug", -- This is a starter sample for developing VS Code debug adapters.
    -- "netcoredbg", -- A debugger for the .net core runtime.
    -- "nickel-lang-lsp", -- A language server protocol implementation for the Nickel configuration language.
    -- "nimlsp", -- nimlsp is a language server for the Nim programming language.
    -- "ocaml-lsp", -- ocaml-lsp is a language server for the OCaml programming language.
    -- "omnisharp", -- omnisharp is a language server for the C#, C++, F#, and VB languages.
    -- "omnisharp-mono", -- omnisharp-mono is a language server for the C#, C++, F#, and VB languages.
    -- "opencl-language-server", -- A language server for the OpenCL programming language.
    -- "perlnavigator", -- perlnavigator is a language server for the Perl programming language.
    -- "php-debug-adapter", -- Debug adapter protocol for the PHP programming language.
    -- "phpactor", -- This project aims to provide heavy-lifting refactoring and introspection tools which can be used standalone or as the backend for a text editor to provide intelligent code completion.
    -- "powershell-editor-services", -- A Language serve protocol implementation for the Powershell scripting language.
    "prettier", -- A opinionated code formatter for: JavaScript (including experimental features), JSX, Angular, Vue, Flow, TypeScript, CSS, Less, and SCSS, HTML, Ember/Handlebars, JSON, GraphQL, Markdown, including GFM and MDX, YAML
    -- "prisma-language-server", -- A language server for the Prisma ORM for Javascript.
    "prosemd-lsp", -- prosemd is an experimental proofreading and linting language server for markdown files. It aims to provide helpful and smart diagnostics when writing prose for technical or non-technical documents alike.
    -- "psalm", -- Psalm is a static analysis tool for finding errors in PHP applications.
    -- "puppet-editor-services", -- Puppet language server protocol implementation.
    -- "purescript-language-server", -- A language server protocol implementation for Purescript which is a strongly-typed functional programming language that compiles to JavaScript.
    "pylint", -- Pylint is a static code analyser for Python 2 or 3.
    "pyright", -- Pyright is a fast type checker meant for large Python source bases. It can run in a “watch” mode and performs fast incremental updates when files are modified.
    -- "python-lsp-server", -- A Python 3.7+ implementation of the Language Server Protocol. (Note: versions <1.4 should still work with Python 3.6)
    "quick-lint-js", -- quick-lint-js is a JavaScript linter that runs in the background and provides linting feedback as fast as you can type.
    -- "r-languageserver", -- A langauge server implementation for the R programming language.
    -- "reason-language-server", -- A language server implementation for the Reason programming language.
    "remark-language-server", -- A language server which can lint and format markdown files using remark.
    -- "rescript-lsp", -- A language server for the ReScript language that compiles to Javascript.
    "revive", -- Fast, configurable, extensible, flexible, and beautiful linter for Go. Drop-in replacement of golint.
    -- "rnix-lsp", -- rnix is a language server for the Nix configuration language.
    -- "robotframework-lsp", -- A language server protocol implementation for for the Robotframework which is Robot Framework is a generic open source automation framework. It can be used for test automation and robotic process automation (RPA).
    "rome", -- Rome is a formatter, linter, bundler, and more for JavaScript, TypeScript, JSON, HTML, Markdown, and CSS.
    "rust-analyzer", -- Rust Analyzer is a static analyzer and language server for Rust.
    "salt-lsp", -- A language server protocol implementation for the Salt configuration language.
    -- "serve-d", -- serve-d is a language server for the D programming language.
    "shellcheck", -- ShellCheck is a static analyzer for shell scripts.
    "shfmt", -- shfmt is a formatting tool for shell scripts.
    -- "shopify-theme-check", -- A linter for Shopify themes.
    -- "solargraph", -- Solargraph is a Ruby Language Server protocol implementation.
    -- "sorbet", -- This repository contains Sorbet, a fast, powerful type checker designed for Ruby.
    -- "sourcery", -- Sourcery is a code generator for Swift language, built on top of Apple's own SwiftSyntax.
    "sqlls", -- A language server protocol implementation for SQL.
    "sqls", -- A linting tool for SQL.
    "staticcheck", -- Staticcheck is a state of the art linter for the Go programming language. Using static analysis, it finds bugs and performance issues, offers simplifications, and enforces style rules.
    "stylelint-lsp", -- stylelint-lsp is a language server for the CSS language.
    "stylua", -- Stylua is a source code formatter for the Lua language.
    "svelte-language-server", -- Svelte language server protocol implementation. Svelte is a radical new approach to building user interfaces. Whereas traditional frameworks like React and Vue do the bulk of their work in the browser, Svelte shifts that work into a compile step that happens when you build your app.
    -- "svlangserver", -- A langauge server protocol implementation for SystemVerilog. SystemVerilog, standardized as IEEE 1800, is a hardware description and hardware verification language used to model, design, simulate, test and implement electronic systems.
    -- "svls", -- SystemVerilog language server
    "tailwindcss-language-server", -- Language Server Protocol implementation for Tailwind CSS.
    "taplo", -- A versatile, feature-rich TOML toolkit and Language server protocol implementation for TOML.
    -- "teal-language-server", -- A language server protocol implementation for Teal which is a staticly typed language that compiles to Lua.
    "terraform-ls", -- Language server for the Terraform language.
    "texlab", -- TeXLab is a language server protocol implementation for LaTex.
    -- "tflint", -- tflint is a linter for the Terraform language.
    "typescript-language-server", -- Language Server Protocol implementation for TypeScript.
    -- "vala-language-server", -- This is a language server for the Vala programming language.
    -- "verible", -- Verible is a suite of tools for working with Verilog code.
    -- "vetur-vls", -- Vetur is a language server protocol implementation for Vue.js.
    -- "vim-language-server", -- A language server for the Vimscript scripting language.
    -- "vint", -- Vint is a Vim script Language Linting tool.
    -- "visualforce-language-server", --
    "vls", -- A language server for the V language which compiles to C.
    -- "vue-language-server", -- A language server protocol implementation for Vue.js.
    -- "wgsl-analyzer", -- A language server protocol implementation for the WebGPU Shading Language (WGSL).
    "yaml-language-server", -- A language server protocol implementation for YAML.
    -- "zk", -- A plain text note-taking assistant
    -- "zls", -- A language server for the Zig programming language.
  },

  -- if set to true this will check each tool for updates. If updates
  -- are available the tool will be updated.
  auto_update = true,
}
