local haslspconfig, lspconfig = pcall(require, "lspconfig")

if not haslspconfig or lspconfig == true then
    return
end

if vim.fn.executable("gopls") == 0 then
    return
end

lspconfig.gopls.setup{}
