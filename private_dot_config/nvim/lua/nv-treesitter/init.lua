function CONFIG_TREESITTER()
    local hastreesitter, treesiter_configs = pcall(require, "nvim-treesitter.configs")

    if not hastreesitter then
        return
    end

    treesiter_configs.setup {
        ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
        -- TODO seems to be broken
        ignore_install = {"haskell"},
        highlight = {
            enable = true -- false will disable the whole extension
        },
        indent = {enable = false, disable_filetype = {"python"}},
        playground = {
            enable = true,
            disable = {},
            updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
            persist_queries = false -- Whether the query persists across vim sessions
        },
        autotag = {enable = true},
        rainbow = {enable = true},
        context_commentstring = {enable = true, config = {javascriptreact = {style_element = '{/*%s*/}'}}}
    }
end

function CONFIG_TREESITTER_REFACTOR()
    local hastreesitter, treesiter_configs = pcall(require, "nvim-treesitter.configs")

    if not hastreesitter then
        return
    end

    treesiter_configs.setup {
        refactor = {
            highlight_definitions = { enable = true },
        },
    }
end
