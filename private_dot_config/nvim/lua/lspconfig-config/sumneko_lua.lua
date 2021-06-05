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

if hasluadev then
    local luadev = lua_dev.setup({
        lspconfig = {
            cmd = {lua_server}
        },
    })
    lspconfig.sumneko_lua.setup(luadev)
else
    lspconfig.sumneko_lua.setup(lua_server)
end
