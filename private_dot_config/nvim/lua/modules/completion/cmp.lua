local M = {}

function M.config()
    local cmp = require("cmp")
    vim.g.vsnip_snippet_dir = vim.fn.stdpath("config") .. "/snippets"

    cmp.setup({
        completion = {
            autocomplete = { cmp.TriggerEvent.TextChanged },
        },
        documentation = {
            border = "single",
            winhighlight = "NormalFloat:CmpDocumentation,FloatBorder:CmpDocumentationBorder",
        },
        experimental = {
                native_menu = false,
                ghost_text = true,
        },
        -- formatting = {
        --         format = lspkind.cmp_format {
        --                 with_text = true,
        --                 menu = {
        --                         buffer = "[BUF]",
        --                         luasnip = "[SNIP]",
        --                         nvim_lsp = "[LSP]",
        --                         nvim_lua = "[LUA]",
        --                         path = "[PATH]",
        --                 },
        --         }
        -- },
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
            { name = "nvim_lua" },
            { name = "nvim_lsp" },
            { name = "buffer" },
            { name = "path", keyword_length = 5 },
        },
    })

    -- If you want insert `(` after select function or method item
    local hascmpautopairs, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
    if not hascmpautopairs then
        return
    end

    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end

return setmetatable({}, {
    __call = function()
        return M.config()
    end,
})
