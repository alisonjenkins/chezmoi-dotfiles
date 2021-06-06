function CONFIG_LSPCONFIG()
    local enabled_lspconfigs = {
        "bashls",
        "cssls",
        "dockerls",
        "rls",
        "sumneko_lua",
        "terraformls",
        "yamlls",
    }

    for _, lsp_name in ipairs(enabled_lspconfigs) do
        require("lspconfig-config." .. lsp_name)
    end
end
