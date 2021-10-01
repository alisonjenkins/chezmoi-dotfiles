function CONFIG_LSPCONFIG()
    -- import lspinstall and lspconfig
    haslspinstall, lspinstall = pcall(require, "lspinstall")
    haslspconfig, lspconfig = pcall(require, "lspconfig")

    -- Sort out capabilities for the completion
    hascmp_nvim_lsp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    capabilities = vim.lsp.protocol.make_client_capabilities()
    if hascmp_nvim_lsp then
        capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
    end

    if haslspinstall then
        lspinstall.setup()
    end

    local enabled_lspconfigs = {
        "bashls",
        "cssls",
        "dockerls",
        "gopls",
        "jdtls",
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
