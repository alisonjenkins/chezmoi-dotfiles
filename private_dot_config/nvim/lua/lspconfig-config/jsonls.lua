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

lspconfig.jsonls.setup{
    cmd = {bin_name, "--stdio"};
}
