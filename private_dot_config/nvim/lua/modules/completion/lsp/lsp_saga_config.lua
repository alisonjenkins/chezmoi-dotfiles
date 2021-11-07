local M = {}

function M.config()
        local hassaga, saga = pcall(require, "lspsaga")
        if not hassaga then
                return
        end

        saga.init_lsp_saga {
        }
end

return setmetatable({}, {
    __call = function()
        return M.config()
    end,
})
