local M = {}

function M.config()
end

return setmetatable({}, {
    __call = function()
        return M.config()
    end,
})
