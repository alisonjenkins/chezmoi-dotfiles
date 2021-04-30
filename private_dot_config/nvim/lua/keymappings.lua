-- better window movement
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {silent = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {silent = true})

-- Terminal window navigation
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<C-h>', '<C-\\><C-N><C-w>h', {noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<C-j>', '<C-\\><C-N><C-w>j', {noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<C-k>', '<C-\\><C-N><C-w>k', {noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<C-l>', '<C-\\><C-N><C-w>l', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-h>', '<C-\\><C-N><C-w>h', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-j>', '<C-\\><C-N><C-w>j', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-k>', '<C-\\><C-N><C-w>k', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-l>', '<C-\\><C-N><C-w>l', {noremap = true, silent = true})

-- Better nav for omnicomplete
vim.api.nvim_set_keymap('i', '<C-j>', '(\"\\<C-n>\")', {noremap = true, expr = true})
vim.api.nvim_set_keymap('i', '<C-k>', '(\"\\<C-p>\")', {noremap = true, expr = true})

-- Set leader
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})
vim.g.mapleader = ' '

-- Setup leader based mappings with which-key so they are documented and
-- a cheatsheet is presented when leader is activated
local wk = require("which-key")

wk.register(
    {
        -- Goyo maps
        z = { "<cmd>Goyo<cr>", "Goyo" },

        -- NvimTree maps
        e = { "<cmd>NvimTreeToggle<cr>", "Nvim Tree Toggle" },
        ["?"] = { "<cmd>NvimTreeFindFile<cr>", "Nvim Tree Find File" },

        -- Splitting maps (ported from the old whichkey bindings
        h = { "<C-W>s", "Split horizontally" },
        v = { "<C-W>v", "Split vertically" },

        -- Startify maps
        [";"] = { "<cmd>Startify<cr>", "Show Startify" },

        -- Telescope mappings
        f = { "<cmd>Telescope find_files<cr>", "Find files (Telescope)" },

        -- s is for search powered by Telescope
        s = {
            name = "+search",
            ["."] = { "<cmd>Telescope filetypes<cr>",                                 "Filetypes" },
            B     = { "<cmd>Telesccope git_branches<cr>",                             "Git Branches" },
            D     = { "<cmd>Telescope lsp_workspace_diagnostics<cr>",                 "Workspace Diagnostics" },
            M     = { "<cmd>Telescope man_pages<cr>",                                 "Man Pages" },
            d     = { "<cmd>Telescope lsp_document_diagnostics<cr>",                  "Document Diagnostics" },
            f     = { "<cmd>Telesccope find_files<cr>",                               "Files" },
            h     = { "<cmd>Telescope command_history<cr>",                           "Command History" },
            i     = { "<cmd>Telescope media_files<cr>",                               "Media Files" },
            m     = { "<cmd>Telescope marks<cr>",                                     "Marks" },
            o     = { "<cmd>Telescope vim_options<cr>",                               "Vim Options" },
            p     = { "<cmd>lua require'telescope'.extensions.project.project{}<cr>", "Projeccts" },
            r     = { "<cmd>Telesccope registers<cr>",                                "Registers" },
            t     = { "<cmd>Telescope live_grep<cr>",                                 "Text" },
            u     = { "<cmd>Telescope colorscheme<cr>",                               "Colorschemes" },
            w     = { "<cmd>Telescope file_browser<cr>",                              "File browser" },
        },

        -- l is for Language Server Protocol (LSP)
        l = {
            name = "+lsp",
            A = { "<cmd>Lspsaga range_code_action<cr>",           "Selected Action" },
            D = { "<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics" },
            H = { "<cmd>Lspsaga signature_help<cr>",              "Signature Help" },
            I = { "<cmd>LspInfo<cr>",                             "LSP Info" },
            L = { "<cmd>Lspsaga show_line_diagnostics<cr>",       "Line Diagnostics" },
            S = { "<cmd>Telescope lsp_workspace_symbols<cr>",     "Workspace Symbols" },
            T = { "<cmd>LspTypeDefinition<cr>",                   "Type Defintion" },
            a = { "<cmd>Lspsaga code_action<cr>",                 "Code Action" },
            d = { "<cmd>Telescope lsp_document_diagnostics<cr>",  "Document Diagnostics" },
            f = { "<cmd>LspFormatting<cr>",                       "Format" },
            l = { "<cmd>Lspsaga lsp_finder<cr>",                  "LSP Finder" },
            o = { "<cmd>Vista!!<cr>",                             "Outline" },
            p = { "<cmd>Lspsaga preview_definition<cr>",          "Preview Definition" },
            q = { "<cmd>Telescope quickfix<cr>",                  "Quickfix" },
            r = { "<cmd>Lspsaga rename<cr>",                      "Rename" },
            s = { "<cmd>Telescope lsp_document_symbols<cr>",      "Document Symbols" },
            v = { "<cmd>LspVirtualTextToggle<cr>",                "LSP Toggle Virtual Text" },
            x = { "<cmd>cclose<cr>",                              "Close Quickfix" },
        },

        -- Markdown Preview mappings
        M = { "<cmd>MarkdownPreviewToggle<cr>", "Preview Markdown" },

        -- Treesitter mappings
        T = { "<cmd>TSHighlightCapturesUnderCursor<cr>", "Highlight Treesitter capture under cursor" },

        -- Git mappings (all start with g)
        g = {
            name = "+git",
            B = { "<cmd>GBrowse<cr>",                 "Browse" },
            a = { "<cmd>Gwrite<cr>",                  "Add" },
            b = { "<cmd>Gblame<cr>",                  "Blame" },
            c = { "<cmd>Git commit<cr>",              "Commit" },
            d = { "<cmd>Git diff<cr>",                "Diff" },
            l = { "<cmd>Git log<cr>",                 "Log" },
            p = { "<cmd>Git push<cr>",                "Push" },
            s = { "<cmd>Gstatus<cr>",                 "Status" },
            t = { "<cmd>!gh pr create --web<cr>",     "Pull request" },
        },
    },
    { prefix = "<leader>" }
)