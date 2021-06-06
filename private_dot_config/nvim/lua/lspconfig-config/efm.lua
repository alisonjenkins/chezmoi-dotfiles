local haslspconfig, lspconfig = pcall(require, "lspconfig")

if not haslspconfig or lspconfig == true then
    return
end

if vim.fn.executable("efm-langserver") == 0 then
    return
end

lspconfig.efm.setup{
    init_options = {documentFormatting = false},
    settings = {
        rootMarkers = {".git/"},
        languages = {
            lua = {
                {formatCommand = "lua-format -i", formatStdin = true}
            }
        }
    }
}
