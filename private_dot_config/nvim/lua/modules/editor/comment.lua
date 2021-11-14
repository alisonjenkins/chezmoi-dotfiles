local M = {}

function M.config()
    local options = {}
    require('Comment').setup(options)
end

return setmetatable({}, {
    __call = function()
        return M.config()
    end,
})
