if not haslspconfig or lspconfig == true then
    return
end

lspconfig.jdtls.setup{
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        require "lsp_signature".on_attach()
    end
}
