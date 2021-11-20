local Completion = {}

function Completion.cmp()
    return {
        "hrsh7th/nvim-cmp",
        requires = {
            "L3MON4D3/LuaSnip",
            "f3fora/cmp-spell",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",
            {"tzachar/cmp-tabnine", run="./install.sh"},
        },
        config = require("modules.completion.cmp")(),
    }
end

function Completion.emmet()
    return {
        "mattn/emmet-vim",
        ft = { "javascript", "html", "css", "scss", "sass" },
    }
end

function Completion.lsp()
    return {
        "neovim/nvim-lspconfig",
        config = require("modules.completion.lsp")(),
    }
end

function Completion.lsp_containers()
    return {
        "lspcontainers/lspcontainers.nvim"
    }
end

function Completion.lspkind()
    return {
            "onsails/lspkind-nvim"
    }
end

return Completion
