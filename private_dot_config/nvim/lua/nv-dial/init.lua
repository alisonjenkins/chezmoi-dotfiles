function CONFIG_DIAL()
        local hasdial, dial = pcall(require, "dial")

        if not hasdial then
                return
        end

        dial.augends["custom#boolean"] = dial.common.enum_cyclic{
                name = "boolean",
                strlist = {"true", "false"},
        }
        table.insert(dial.config.searchlist.normal, "custom#boolean")
        vim.cmd([[
        nmap <C-a> <Plug>(dial-increment)
        nmap <C-x> <Plug>(dial-decrement)
        vmap <C-a> <Plug>(dial-increment)
        vmap <C-x> <Plug>(dial-decrement)
        vmap g<C-a> <Plug>(dial-increment-additional)
        vmap g<C-x> <Plug>(dial-decrement-additional)
        ]])
end
