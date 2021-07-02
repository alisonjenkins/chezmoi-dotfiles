function CONFIG_NVIM_COMPE()
        vim.o.completeopt = "menuone,noselect"

        local hascompe, compe = pcall(require,"compe")

        if not hascompe then
                return
        end

        compe.setup {
                enabled = true,
                documentation = true,

                source = {
                        buffer = {kind = "  "},
                        tabnine = {
                                ignore_pattern = '',
                                max_num_results = 10,
                                priority = 5000,
                                show_prediction_strength = true,
                                sort = false,
                        },
                        luasnip = {kind = "  "},
                        nvim_lsp = {kind = "  "},
                        path = {kind = "  "},
                        spell = {kind = "  "},
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
