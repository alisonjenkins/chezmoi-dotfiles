-- Caching
local hasimpatient, impatient = pcall(require, "impatient")
if hasimpatient then
  impatient.enable_profile()
end

require"plugins"
require"options"
require"autocmd"
