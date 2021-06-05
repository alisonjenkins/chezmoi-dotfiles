function CONFIG_LSPKIND()
        local haslspkind, lspkind = pcall(require, "lspkind")

        if not haslspkind then
                return
        end

        -- symbols for autocomplete
        lspkind.init({
                with_text = false,
                symbol_map = {
                        Text = '  ',
                        Method = '  ',
                        Function = '  ',
                        Constructor = '  ',
                        Variable = '[]',
                        Class = '  ',
                        Interface = ' 蘒',
                        Module = '  ',
                        Property = '  ',
                        Unit = ' 塞 ',
                        Value = '  ',
                        Enum = ' 練',
                        Keyword = '  ',
                        Snippet = '  ',
                        Color = '',
                        File = '',
                        Folder = ' ﱮ ',
                        EnumMember = '  ',
                        Constant = '  ',
                        Struct = '  '
                },
        })
end
