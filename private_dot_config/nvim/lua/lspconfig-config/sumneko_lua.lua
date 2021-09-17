local haslspconfig, lspconfig = pcall(require, "lspconfig")

if not haslspconfig or lspconfig == true then
    return
end

local lua_server = ""
if vim.fn.executable("lua-language-server") == 1 then
    lua_server = "lua-language-server"
elseif vim.fn.executable("sumneko-language-server") == 1 then
    lua_server = "sumneko-language-server"
else
    return
end

local hasluadev, lua_dev = pcall(require,"lua-dev")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

if hasluadev then
    local luadev = lua_dev.setup({
        capabilities = capabilities,
        lspconfig = {
            cmd = {lua_server}
        },
    })
    lspconfig.sumneko_lua.setup(luadev)
else
    local runtime_path = vim.split(package.path, ';')

    lspconfig.sumneko_lua.setup{
        capabilities = capabilities,
        cmd=lua_server,
        settings = {
            Lua = {
                runtime = {
                    -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                    version = 'LuaJIT',
                    -- Setup your lua path
                    path = runtime_path,
                },
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = {'vim'},
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = vim.api.nvim_get_runtime_file("", true),
                },
                -- Do not send telemetry data containing a randomized but unique identifier
                telemetry = {
                    enable = false,
                },
            },
        },
        on_attach = function(client, bufnr)
            require "lsp_signature".on_attach()
        end
    }
end
