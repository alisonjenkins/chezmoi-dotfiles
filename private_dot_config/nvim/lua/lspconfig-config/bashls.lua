local haslspconfig, lspconfig = pcall(require, "lspconfig")

if not haslspconfig or lspconfig == true then
    return
end

if vim.fn.executable("bash-language-server") == 1 then

else
    return
end

lspconfig.bashls.setup{}
