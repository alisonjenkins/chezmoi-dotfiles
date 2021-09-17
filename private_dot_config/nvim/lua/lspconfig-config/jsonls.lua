local haslspconfig, lspconfig = pcall(require, "lspconfig")

if not haslspconfig or lspconfig == true then
    return
end

local bin_name = ""

if vim.fn.executable("vscode-json-languageserver") == 1 then
    bin_name = "vscode-json-languageserver"
elseif vim.fn.executable("json-languageserver") == 1 then
    bin_name = "json-languageserver"
else
    return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

lspconfig.jsonls.setup{
    capabilities = capabilities,
    cmd = {bin_name, "--stdio"};
    on_attach = function(client, bufnr)
        require "lsp_signature".on_attach()
    end
}
