local M = {}

function M.config()
    local options = {
        ensure_installed = "all",
        highlight = {
            enable = true,
            use_languagetree = true,
        },
        indent = {
            enable = true,
            disable = { "python" },
        },
        rainbow = {
            enable = true,
        },
        autopairs = {
            enable = true,
        },
        autotag = {
            enable = true,
            filetypes = { "html", "xml" },
        },
    }

    local hastreesitterconfigs, treesitterconfigs = pcall(require, "nvim-treesitter.configs")
    if not hastreesitterconfigs then
      return
    end
    treesitterconfigs.setup(options)
end

return setmetatable({}, {
    __call = function()
        return M.config()
    end,
})
