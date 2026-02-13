local M = {}

function M.setup()
  vim.opt.foldenable = true
  vim.opt.foldlevel = 99
  vim.opt.foldlevelstart = 99
  vim.opt.foldcolumn = '0'

  vim.api.nvim_set_option_value('colorcolumn', '80', {})

  if vim.g.neovide then
    vim.g.neovide_transparency = 0.9
    vim.g.neovide_refresh_rate = 100
    vim.g.neovide_window_blurred = true
  end
end

return M
