if vim.fn.executable("terraform-ls") == 0 then
    return
end

local haslspconfig, lspconfig = pcall(require, "lspconfig")

if not haslspconfig or lspconfig == true then
    return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

lspconfig.terraformls.setup{
    capabilities = capabilities,
}
