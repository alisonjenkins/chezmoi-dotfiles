local M = {}

function M.config()
    local cmp = require("cmp")

    local source_mapping = {
        buffer = "[BUF]",
        cmp_tabnine = "[TN]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[LUA]",
        path = "[PATH]",
    }

    cmp.setup({
        -- completion = {
            -- autocomplete = { cmp.TriggerEvent.TextChanged },
        -- },
        documentation = {
            border = "single",
            winhighlight = "NormalFloat:CmpDocumentation,FloatBorder:CmpDocumentationBorder",
        },
        experimental = {
                native_menu = false,
                ghost_text = true,
        },
        formatting = {
                format = function(entry, vim_item)
                        if haslspkind then
                                vim_item.kind = lspkind.presets.default[vim_item.kind]
                        end
                        local menu = source_mapping[entry.source.name]
                        if entry.source.name == 'cmp_tabnine' then
                                if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
                                        menu = entry.completion_item.data.detail .. ' ' .. menu
                                end
                                vim_item.kind = ''
                        end

                        vim_item.menu = menu
                        return vim_item
                end
        },
        mapping = {
                ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-y>'] = cmp.mapping.confirm {
                                behavior = cmp.ConfirmBehavior.Insert,
                                select = true,
                        },
                ['<C-e>'] = cmp.mapping.close(),
        },
        snippet = {
                expand = function(args)
                        require'luasnip'.lsp_expand(args.body)
                end
        },
        sources = {
            { name = "crates" },
            { name = "nvim_lua" },
            { name = 'orgmode' },
            { name = "nvim_lsp" },
            { name = 'cmp_tabnine' },
            { name = "buffer" },
            { name = 'spell' },
            { name = "path", keyword_length = 5 },
        },
    })
end

return setmetatable({}, {
    __call = function()
        return M.config()
    end,
})
