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
            css = {
                { formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true }
            },
            html = {
                { formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true }
            },
            javascript = {
                { lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}", lintIgnoreExitCode = true, lintStdin = true, lintFormats = {"%f:%l:%c: %m"}, },
                { formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true },
            },
            javascriptreact = {
                { formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true },
                { lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}", lintIgnoreExitCode = true, lintStdin = true, lintFormats = {"%f:%l:%c: %m"}, },
            },
            json = {
                { lintCommand = "jq .", formatStdin = true },
                { formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true }
            },
            lua = {
                { formatCommand = "lua-format -i", formatStdin = true },
            },
            markdown = {
                { formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true }
            },
            rust = {
                { formatCommand = "rustfmt", formatStdin = true },
            },
            scss = {
                { formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true }
            },
            yaml = {
                { formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true }
            },
        }
    }
}
