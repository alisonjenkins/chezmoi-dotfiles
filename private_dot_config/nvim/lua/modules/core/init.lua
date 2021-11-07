local Core = {}

function Core.keymap()
    return {
        "folke/which-key.nvim",
        config = require("modules.core.keymap")(),
    }
end

return Core
