local Completion = {}

function Completion.autopair()
    return {
        "windwp/nvim-autopairs",
        config = require("modules.completion.autopairs")(),
    }
end

function Completion.cmp()
    return {
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",
            "L3MON4D3/LuaSnip",
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

function Completion.lspsaga()
    return {
        "glepnir/lspsaga.nvim",
        config = require("modules.completion.lsp.lsp_saga_config")(),
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
