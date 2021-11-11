-- vim: set foldmethod=marker foldlevel=0:
local haslspconfig, lspconfig = pcall(require, "lspconfig")
if not haslspconfig then
        return
end

local haslspcontainers, lspcontainers = pcall(require, "lspcontainers")
local c = require("modules.completion.lsp.custom")

local lsp_servers = {}

-- {{{ Bash
lsp_servers["bashls"] = {}
-- }}}

-- {{{ C
lsp_servers["clangd"] = {}
-- }}}

-- {{{ CSS
lsp_servers["cssls"] = {}
lsp_servers["cssls"]["cmd"] = {"lua-language-server", "--stdio"}
-- }}}

-- {{{ Docker
lsp_servers["dockerls"] = {}
-- }}}

-- {{{ Go
lsp_servers["gopls"] = {}
lsp_servers["gopls"]["cmd"] = {"gopls", "serve"}
lsp_servers["gopls"]["settings"] = {
        gopls = {
                analyses = {
                        unusedparams = true,
                },
                staticcheck = true,
                usePlaceholders = false,
        },
}
-- }}}

-- {{{ JSON
lsp_servers["jsonls"] = {}
lsp_servers["jsonls"]["cmd"] = { "vscode-json-languageserver", "--stdio" }
-- }}}

-- {{{ Lua
lsp_servers["sumneko_lua"] = {}
lsp_servers["sumneko_lua"]["cmd"] = {
        "lua-language-server",
        string.format("--logpath=%s/.cache/nvim/sumneko_lua",
        vim.loop.os_homedir())
}
lsp_servers["sumneko_lua"]["settings"] = {
        Lua = {
                runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
                telemetry = {
                        enable = false,
                },
                diagnostics = {
                        enable = true,
                        globals = { "vim", "awesome", "use", "client", "root", "s", "screen" },
                },
                workspace = {
                        library = {
                                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                                ["/usr/share/awesome/lib"] = true,
                                ["/usr/share/lua/5.1"] = true,
                                ["/usr/share/lua/5.3"] = true,
                                ["/usr/share/lua/5.4"] = true,
                        },
                },
        },
}
-- }}}

-- {{{ Python - Jedi
-- lspconfig.jedi_language_server.setup(c.default({
--     settings = {
--         jedi = {
--             enable = true,
--             startupMessage = true,
--             markupKindPreferred = "markdown",
--             jediSettings = {
--                 autoImportModules = {},
--                 completion = { disableSnippets = false },
--                 diagnostics = { enable = true, didOpen = true, didSave = true, didChange = true },
--             },
--             workspace = { extraPaths = {} },
--         },
--     },
-- }))
-- }}}

-- {{{ Python - Pyright
lsp_servers["pyright"] = {}
lsp_servers["pyright"]["settings"] = {
        python = {
                analysis = {
                        useLibraryCodeForTypes = false,
                        autoSearchPaths = true,
                        diagnosticMode = "openFilesOnly",
                        typeCheckingMode = "basic",
                },
        },
}
-- }}}

-- {{{ SQL
lsp_servers["sqls"] = {}
lsp_servers["sqls"]["cmd"] = {
        "sqls",
        "-config",
        vim.loop.os_homedir() .. "/.config/sqls/config.yml"
}
lsp_servers["sqls"]["on_init"] = c.custom_on_init
lsp_servers["sqls"]["capabilities"] = c.custom_capabilities()
lsp_servers["sqls"]["on_attach"] = function(client)
        client.resolved_capabilities.execute_command = true
        require("sqls").setup({ picker = "default" })
end
-- }}}

-- {{{ Terraform
lsp_servers["terraformls"] = {}
-- }}}

-- {{{ Tex
lsp_servers["texlab"] = {}
-- }}}

-- {{{ Typescript
lsp_servers["tsserver"] = {}
lsp_servers["tsserver"]["settings"] = {
        tsserver = {
                useBatchedBufferSync = true,
        },
        javascript = {
                autoClosingTags = true,
                suggest = {
                        autoImports = true,
                },
                updateImportsOnFileMove = {
                        enable = true,
                },
                suggestionActions = {
                        enabled = false,
                },
        },
}
-- }}}

-- {{{ Vim
lsp_servers["vimls"] = {}
-- }}}

-- {{{ YAML
lsp_servers["yamlls"] = {}
lsp_servers["yamlls"]["settings"] = {
        yaml = {
                format = {
                        enable = true,
                        singleQuote = true,
                        bracketSpacing = true,
                },
                editor = {
                        tabSize = 2,
                },
                schemas = {
                        ["https://json.schemastore.org/github-workflow.json"] = "ci.yml",
                        ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose.yml",
                },
        },
}
-- }}}

if haslspcontainers then
        for lsp_name, lsp in pairs(lsp_servers) do
                if lspcontainers.supported_languages[lsp_name] ~= nil then
                        if vim.fn.executable("podman") == 1 then
                                container_runtime = "podman"
                        elseif vim.fn.executable("docker") then
                                container_runtime = "docker"
                        end
                        lsp_servers[lsp_name]["cmd"] = lspcontainers.command(
                                lsp_name,
                                {
                                        container_runtime = container_runtime
                                }
                        )
                end
        end
end

for lsp_name, lsp in pairs(lsp_servers) do
    lspconfig[lsp_name].setup(c.default({
        ["cmd"] = lsp["cmd"],
        ["settings"] = lsp["settings"],
}))
end
