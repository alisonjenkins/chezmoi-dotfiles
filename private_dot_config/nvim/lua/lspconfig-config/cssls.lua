local haslspconfig, lspconfig = pcall(require, "lspconfig")

if not haslspconfig or lspconfig == true then
    return
end

if vim.fn.executable("css-languageserver") == 1 then

else
    return
end

lspconfig.cssls.setup{}
