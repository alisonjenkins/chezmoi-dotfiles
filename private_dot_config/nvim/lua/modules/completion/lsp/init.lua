local M = {}

function M.config()
    require("modules.completion.lsp.langserver")
    require("modules.completion.lsp.diagnostic")
end

function M.lsp_saga_config()
        require("modules.completion.lsp.lsp_saga_config")
end

return setmetatable({}, {
    __call = function()
        return M.config()
    end,
})
