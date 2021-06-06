if vim.fn.executable("terraform-ls") == 0 then
    return
end

local haslspconfig, lspconfig = pcall(require, "lspconfig")

if not haslspconfig or lspconfig == true then
    return
end

lspconfig.terraformls.setup{}
