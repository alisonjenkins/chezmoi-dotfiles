function CONFIG_LSPCONFIG()
    local enabled_lspconfigs = {
        "bashls",
        "cssls",
        "dockerls",
        "jsonls",
        "rls",
        "rust_analyzer",
        "sumneko_lua",
        "terraformls",
        "tflint",
        "yamlls",
    }

    for _, lsp_name in ipairs(enabled_lspconfigs) do
        require("lspconfig-config." .. lsp_name)
    end
end
