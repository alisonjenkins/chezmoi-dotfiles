local haslspconfig, lspconfig = pcall(require, "lspconfig")

if not haslspconfig or lspconfig == true then
    return
end

if vim.fn.executable("tflint") == 0 then
    return
end

lspconfig.tflint.setup{}
