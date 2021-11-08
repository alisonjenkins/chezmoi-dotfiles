local M = {}

function M.config()
        -- Code navigation shortcuts
        vim.api.nvim_set_keymap('n', '<c-]>',  ':lua vim.lsp.buf.definition()<CR>', {silent = true})
        vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', {silent = true})
        vim.api.nvim_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.implementation()<CR>', {silent = true})
        vim.api.nvim_set_keymap('n', '<c-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', {silent = true})
        vim.api.nvim_set_keymap('n', '1gD', '<cmd>lua vim.lsp.buf.type_definition()<CR>', {silent = true})
        vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', {silent = true})
        vim.api.nvim_set_keymap('n', 'g0', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', {silent = true})
        vim.api.nvim_set_keymap('n', 'gW', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', {silent = true})
        vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua require("telescope.builtin").lsp_definitions()<CR>', {silent = true})

        -- better window movement
        vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {silent = true})
        vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {silent = true})
        vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {silent = true})
        vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {silent = true})

        -- Set leader
        vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})
        vim.g.mapleader = ' '

        -- Setup leader based mappings with which-key so they are documented and
        -- a cheatsheet is presented when leader is activated
        local wk = require("which-key")

        wk.register(
                {
                        -- Goyo maps
                        z = { "<cmd>Goyo 100%x100%<cr>", "Start Goyo fullscreen" },
                        Z = { "<cmd>Goyo<cr>", "Toggle Goyo" },

                        -- Splitting maps (ported from the old whichkey bindings
                        h = { "<C-W>s", "Split horizontally" },
                        v = { "<C-W>v", "Split vertically" },

                        -- Startify maps
                        [";"] = { "<cmd>Startify<cr>", "Show Startify" },

                        -- Debug mappings
                        d = {
                                name = "+debug",
                                b     = {
                                        name = "+breakpoint",
                                        b     = { "<cmd>lua require\"dap\".toggle_breakpoint()<CR>", "DAP Toggle Breakpoint" },
                                        c     = { "<cmd>lua require\"dap\".set_breakpoint(vim.fn.input(\"Breakpoint condition: \"))<CR>",         "DAP Set Conditional Breakpoint"},
                                        l     = { "<cmd>lua require\"dap\".set_breakpoint(nil, nil, vim.fn.input(\"Log point message: \"))<CR>" , "DAP Log Point"},
                                },
                                c     = { "<cmd>lua require\"dap\".continue()<CR>", "DAP Continue" },
                                i     = { "<cmd>lua require\"dap.ui.widgets\".hover()<CR>", "DAP Hover (Inspect Variable under cursor)"},
                                r     = { 
                                        name = "+repl",
                                        r = {"<cmd>lua require\"dap\".repl.open()<CR>",     "DAP REPL" }, 
                                        l = {"<cmd>lua require\"dap\".repl.run_last()<CR>", "DAP REPL Run Last" }, 
                                },
                                S     = { "<cmd>lua require\"dap\".stop()<CR>", "DAP Stop" },
                                s     = {
                                        name  = "+step", 
                                        i     = { "<cmd>lua require\"dap\".step_into()<CR>",                                                      "DAP Step Into" }, 
                                        o     = { "<cmd>lua require\"dap\".step_out()<CR>",                                                       "DAP Step Out" }, 
                                        v     = { "<cmd>lua require\"dap\".step_over()<CR>",                                                      "DAP Step Over" }, 
                                },
                                t = {
                                        name = "+telescope",
                                        b = { '<cmd>lua require"telescope".extensions.dap.list_breakpoints{}<CR>', "DAP Breakpoints" },
                                        c = { '<cmd>lua require"telescope".extensions.dap.commands{}<CR>', "DAP Commands" },
                                        f = { '<cmd>lua require"telescope".extensions.dap.frames{}<CR>', "DAP Frames" },
                                        o = { '<cmd>lua require"telescope".extensions.dap.configurations{}<CR>', "DAP Configuration" },
                                        v = { '<cmd>lua require"telescope".extensions.dap.variables{}<CR>', "DAP Variables" },
                                },
                        },

                        -- Telescope mappings
                        f = { "<cmd>Telescope find_files<cr>", "Find files (Telescope)" },

                        -- s is for search powered by Telescope
                        s = {
                                name = "+search",
                                ["."] = { "<cmd>Telescope filetypes<cr>",                                                                               "Filetypes" },
                                D     = { "<cmd>Telescope lsp_workspace_diagnostics<cr>",                                                               "Workspace Diagnostics" },
                                M     = { "<cmd>Telescope man_pages<cr>",                                                                               "Man Pages" },
                                T     = { "<cmd>TodoTelescope<cr>",                                                                                     "Todo comments" },
                                b     = { "<cmd>Telescope git_branches<cr>",                                                                            "Git Branches" },
                                d     = { "<cmd>Telescope lsp_document_diagnostics<cr>",                                                                "Document Diagnostics" },
                                e     = { "<cmd>Telescope frecency<cr>",                                                                                "Frecently edited files" },
                                f     = { "<cmd>Telescope find_files<cr>",                                                                              "Files" },
                                h     = { "<cmd>Telescope command_history<cr>",                                                                         "Command History" },
                                i     = { "<cmd>Telescope media_files<cr>",                                                                             "Media Files" },
                                m     = { "<cmd>Telescope marks<cr>",                                                                                   "Marks" },
                                o     = { "<cmd>Telescope vim_options<cr>",                                                                             "Vim Options" },
                                p     = { "<cmd>Telescope projects<cr>",                                                                                "Projects" },
                                r     = { "<cmd>Telescope registers<cr>",                                                                               "Registers" },
                                t     = { "<cmd>Telescope live_grep<cr>",                                                                               "Text" },
                                u     = { "<cmd>Telescope colorscheme<cr>",                                                                             "Colorschemes" },
                                w     = { "<cmd>Telescope file_browser<cr>",                                                                            "File browser" },
                                x     = { "<cmd>lua require'telescope.builtin'.find_files({prompt_title = '<Switch Project>', cwd = '$HOME/git'})<cr>", "Switch Project (file search)" },
                                z     = { "<cmd>lua require'telescope'.extensions.zoxide.list{}<cr>",                                                   "Switch directory with Z" },
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
                                T = { "<cmd>lua require'lspsaga.provider'.preview_definition(<cr>", "Type Defintion" },
                                a = { "<cmd>Lspsaga code_action<cr>",                 "Code Action" },
                                d = { "<cmd>Telescope lsp_document_diagnostics<cr>",  "Document Diagnostics" },
                                f = { "<cmd>lua vim.lsp.buf.formatting()<cr>",        "Format" },
                                l = { "<cmd>Lspsaga lsp_finder<cr>",                  "LSP Finder" },
                                o = { "<cmd>AerialToggle<cr>",                        "Outline" },
                                p = { "<cmd>Lspsaga preview_definition<cr>",          "Preview Definition" },
                                q = { "<cmd>Telescope quickfix<cr>",                  "Quickfix" },
                                r = { "<cmd>Lspsaga rename<cr>",                      "Rename" },
                                s = { "<cmd>Telescope lsp_document_symbols<cr>",      "Document Symbols" },
                                t = {
                                        name = "+trouble",
                                        t = { "<cmd>LspTroubleToggle<cr>",      "Toggle Trouble" },
                                        w = { "<cmd>LspTroubleWorkspaceToggle<cr>",      "Toggle Trouble Workspace mode" },
                                        d = { "<cmd>LspTroubleDocumentToggle<cr>",       "Toggle Trouble Document mode" },
                                        r = { "<cmd>LspTroubleRefresh<cr>",              "Refresh Trouble" },
                                },
                                v = { "<cmd>LspVirtualTextToggle<cr>",                "LSP Toggle Virtual Text" },
                                x = { "<cmd>cclose<cr>",                              "Close Quickfix" },
                        },

                        -- Markdown Preview mappings
                        M = { "<cmd>MarkdownPreviewToggle<cr>", "Preview Markdown" },

                        -- Treesitter mappings
                        -- T = { "<cmd>TSHighlightCapturesUnderCursor<cr>", "Highlight Treesitter capture under cursor" },
                        T = { 
                                name = "+Treesitter",
                                b = {"<cmd>lua require('nvim-biscuits').toggle_biscuits()<cr>", "Toggle biscuits" },
                        },

                        -- Git mappings (all start with g)
                        g = {
                                name = "+git",
                                B = { "<cmd>GBrowse<cr>",                 "Browse" },
                                a = { "<cmd>Gwrite<cr>",                  "Add" },
                                b = { "<cmd>Gblame<cr>",                  "Blame" },
                                c = {
                                        name = "+commit",
                                        c = {"<cmd>Git commit<cr>",         "Commit" },
                                        a = {"<cmd>Git commit --amend<cr>", "Commit Amend" },
                                },
                                d = { "<cmd>Git diff<cr>",                    "Diff" },
                                l = { "<cmd>Git log<cr>",                     "Log" },
                                p = { "<cmd>Git push<cr>",                    "Push" },
                                s = { "<cmd>Git<cr>",                         "Status" },
                                t = { "<cmd>terminal gh pr create --web<cr>", "Pull request" },
                                m = { "<cmd>GitMessenger<cr>",                "Line commit history" },
                                w = {
                                        name = "+git worktree",
                                        c = {"<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>", "Create worktree"},
                                        s = {"<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>",       "Switch"},
                                }
                        },

                        -- Quickfix mappings (all start with q)
                        q = {
                                name = "+quickfix",
                                t = { "<cmd>TodoQuickFix<cr>",  "Todo quickfix"},
                        },
                        m = {
                                name = "+Marks (using Harpoon)",
                                m = {"<cmd>lua require('harpoon.mark').add_file()<cr>", "Create mark using Harpoon"},
                                a = {"<cmd>lua require('harpoon.ui').nav_file(1)<cr>", "Open mark 1"},
                                s = {"<cmd>lua require('harpoon.ui').nav_file(2)<cr>", "Open mark 2"},
                                d = {"<cmd>lua require('harpoon.ui').nav_file(3)<cr>", "Open mark 3"},
                                f = {"<cmd>lua require('harpoon.ui').nav_file(4)<cr>", "Open mark 4"},
                                M = {"<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Toggle marks menu"}
                        }
                },
                { prefix = "<leader>" }
        )
end



-- local keymap = vim.api.nvim_set_keymap

-- local function set_keybindings()
--     local noremap_silent = { noremap = true, silent = true }
--     local remap_silent = { noremap = false, silent = true }
--     local remap_nosilent = { noremap = false, silent = true }
--     local keybindings = {
--         -- {'mode', 'keybindings', 'command', '{noremap=bool', 'silent=bool', expr=bool}}
-- 
--         -- disable keys
--         { "n", "Q", "<Nop>", noremap_silent },
--         { "n", "<Left>", "<Nop>", noremap_silent },
--         { "n", "<Right>", "<Nop>", noremap_silent },
--         { "n", "<Up>", "<Nop>", noremap_silent },
--         { "n", "<Down>", "<Nop>", noremap_silent },
--         { "n", "<C-z>", "<Nop>", noremap_silent },
-- 
--         -- resize window
--         { "n", "<C-Left>", "<CMD>vertical resize +5<CR>", noremap_silent },
--         { "n", "<C-Up>", "<CMD>resize -5<CR>", noremap_silent },
--         { "n", "<C-Right>", "<CMD>vertical resize -5<CR>", noremap_silent },
--         { "n", "<C-Down>", "<CMD>resize +5<CR>", noremap_silent },
-- 
-- 
--         -- split window
--         { "n", "<C-A-k>", "<C-w>t<C-w>K", remap_silent },
--         { "n", "<C-A-h>", "<C-w>t<C-w>H", remap_silent },
-- 
--         -- terminal mode
--         { "t", "<Esc>", "<C-\\><C-n>", noremap_silent },
-- 
--         -- nvim tree.lua
--         { "n", "`", '<CMD>lua require("utils.nvimtree").toggle()<CR>', noremap_silent },
-- 
--         -- base64
--         {
--             "v",
--             "<Leader>d6",
--             "c<C-r>=system('base64 -d', @\")<CR><ESC>",
--             remap_nosilent,
--         },
--         {
--             "v",
--             "<Leader>e6",
--             "c<C-r>=system('base64', @\")<CR><ESC>",
--             remap_nosilent,
--         },
-- 
--         -- emmet-vim
--         { "i", "<A-Tab>", "<C-y>,", remap_silent },
--         { "v", "<A-Tab>", "<C-y>,", remap_silent },
-- 
--         -- Delete in search result
--         { "n", "<Leader>x", "<CMD>%s///<CR>", remap_silent },
-- 
--         -- Search for visually selected text
--         { "v", "<Leader>v", "y/\\V<C-R>=escape(@\",'/\\')<CR><CR>", remap_silent },
-- 
--         -- format.nvim
--         { "n", "<leader>F", "<CMD>FormatWrite<CR>", remap_silent },
--     }
-- 
--     for _, key in pairs(keybindings) do
--         keymap(key[1], key[2], key[3], key[4])
--     end
-- end
-- set_keybindings()

return setmetatable({}, {
        __call = function()
                return M.config()
        end,
})