-- Caching
local hasimpatient, impatient = pcall(require, "impatient")
if hasimpatient then
  impatient.enable_profile()
end

require"modules.core.settings"
require"modules.packer"
require"modules.core.keymap"

-- Plugin configs
-- require('lspconfig-config')
-- require('nv-navigator')
-- require('nv-neuron')
-- require('nv-colorizer')
-- require('nv-dial')
-- require('nv-emmet')
-- require('nv-firenvim')
-- require('nv-floaterm')
-- require('nv-galaxyline')
-- require('nv-gitblame')
-- require('nv-gitsigns')
-- require('nv-hop')
-- require('nv-lightbulb')
-- require('nv-lspkind')
-- require('nv-matchup')
-- require('nv-nvimtree')
-- require('nv-quickscope')
-- require('nv-startify')
-- require('nv-telescope')
-- require('nv-terraform-completion')
-- require('nv-treesitter')
-- require('nv-vim-rooter')
-- require('nv-vimspector')
-- require('nvim-dap')
-- require('nv-project')
-- require('nv-rust-tools')
-- require('nv-vim-terraform')
-- require('nv-whichkey')

-- Load plugins
-- require('plugins')
