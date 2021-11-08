local is_installed, packer = pcall(require, "packer")
local use = packer.use

local function bootstrap()
    local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
        vim.fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd("packadd packer.nvim")
    end
end

if not is_installed then
    bootstrap()
else
    packer.init({
        display = {
            open_cmd = "leftabove 80vnew [packer]",
            header_sym = "─",
        },
        profile = {
            enable = true,
            threshold = 1,
        },
    })

    packer.startup(function()
        local completion = require("modules.completion")
        local core = require("modules.core")
        local editor = require("modules.editor")
        local ui = require("modules.ui")

        use({ "wbthomason/packer.nvim" })

        use({ "lewis6991/impatient.nvim" })

        use({
            "tweekmonster/startuptime.vim",
            cmd = "StartupTime",
        })

        use(core.keymap())

        use(completion.cmp())
        use(completion.emmet())
        use(completion.lsp())
        use(completion.lspsaga())
        use(completion.lsp_containers())
        use(completion.lspkind())

        use(ui.colorscheme())
        use(ui.crates())
        use(ui.filemanager())
        use(ui.git())
        use(ui.harpoon())
        use(ui.statusline())
        use(ui.telescope())
        use(ui.treesitter())

        use(editor.aerial())
        use(editor.comment())
        use(editor.diagnostic())
        use(editor.easyalign())
        use(editor.formatter())
        use(editor.gist())
        use(editor.gitsigns())
        use(editor.golang())
        use(editor.header())
        use(editor.markdown())
        use(editor.matchup())
        use(editor.sql())
        use(editor.surround())
        use(editor.translator())

    end)
end
