local M = {}

function M.config()
        local hastreesitterconfigs, treesitterconfigs = pcall(require, "nvim-treesitter.configs")
        if not hastreesitterconfigs then
                return
        end

        local ignore_plugin = {}

        if vim.fn.has("macunix") == 1 then
                table.insert(ignore_plugin, "haskell")
        end

        local options = {
                ensure_installed = "all",
                ignore_install = ignore_plugin,

                highlight = {
                        enable = true,
                        use_languagetree = true,
                },
                indent = {
                        enable = false,
                        disable = { "python" },
                },
                rainbow = {
                        enable = true,
                },
                autopairs = {
                        enable = false,
                },
                autotag = {
                        enable = true,
                        filetypes = { "html", "xml" },
                },
                context_commentstring = {
                        enable = true,
                        config = {
                                javascriptreact = {
                                        style_element = '{/*%s*/}'
                                }
                        }
                }
        }

        treesitterconfigs.setup(options)
end

return setmetatable({}, {
        __call = function()
                return M.config()
        end,
})
