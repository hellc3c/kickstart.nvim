local M = {}

function M.setup()
  require('custom.core.options').setup()
  require('custom.core.keymaps').setup()
  require('custom.core.autocmds').setup()
  require('custom.core.theme').setup()
end

return M
