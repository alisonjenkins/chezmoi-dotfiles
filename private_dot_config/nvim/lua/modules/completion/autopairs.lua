local M = {}

function M.config()
    local hasautopairs, autopairs = pcall(require, "nvim-autopairs")

    if not hasautopairs then
        return
    end

    local options = {
        pairs_map = {
            ["'"] = "'",
            ['"'] = '"',
            ["("] = ")",
            ["["] = "]",
            ["{"] = "}",
            ["`"] = "`",
        },
        disable_filetype = { "TelescopePrompt" },
        disable_in_macro = false,
        ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], "%s+", ""),
        enable_moveright = true,
        enable_afterquote = true,
        enable_check_bracket_line = true,
        check_ts = true,
        map_bs = true,
        map_c_w = false,
    }

    autopairs.setup(options)
end

return setmetatable({}, {
    __call = function()
        return M.config()
    end,
})