function CONFIG_NVIM_CMP()
        vim.o.completeopt = "menuone,noselect"

        local hascmp, cmp = pcall(require,"cmp")
        local haslspkind, lspkind = pcall('lspkind')

        if not hascmp then
                return
        end

        local source_mapping = {
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                nvim_lua = "[Lua]",
                cmp_tabnine = "[TN]",
                path = "[Path]",
        }

        cmp.setup {
                snippet = {
                        expand = function(args)
                                vim.fn["vsnip#anonymous"](args.body)
                        end,
                },
                mapping = {
                        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                },
                sources = {
                        { name = "buffer" },
                        { name = "crates" },
                        { name = "path" },
                        { name = 'cmp_tabnine' },
                        { name = 'nvim_lsp' },
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
                }
        }

--         local t = function(str)
--                 return vim.api.nvim_replace_termcodes(str, true, true, true)
--         end
-- 
--         local check_back_space = function()
--                 local col = vim.fn.col('.') - 1
--                 if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
--                         return true
--                 else
--                         return false
--                 end
--         end
-- 
--         _G.tab_complete = function()
--                 if vim.fn.pumvisible() == 1 then
--                         return t "<C-n>"
--                 elseif vim.fn.call("vsnip#available", {1}) == 1 then
--                         return t "<Plug>(vsnip-expand-or-jump)"
--                 elseif check_back_space() then
--                         return t "<Tab>"
--                 else
--                         return vim.fn['compe#complete']()
--                 end
--         end
--         _G.s_tab_complete = function()
--                 if vim.fn.pumvisible() == 1 then
--                         return t "<C-p>"
--                 elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
--                         return t "<Plug>(vsnip-jump-prev)"
--                 else
--                         return t "<S-Tab>"
--                 end
--         end
end
