local M = {}

function M.setup()
  vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = 'none' })

  vim.diagnostic.config { virtual_text = true }
  vim.keymap.set('n', '<leader>de', vim.diagnostic.open_float, { desc = 'Diagnostic: open float' })

  vim.keymap.set('n', '<leader>e', function()
    local ok, mini_files = pcall(require, 'mini.files')
    if ok then
      mini_files.open()
    end
  end, { desc = 'Explorer (mini.files)' })

  vim.keymap.set('n', '<leader>tt', function()
    require('custom.core.theme').pick()
  end, { desc = 'Theme: pick' })

  vim.keymap.set('t', '<C-up>', '<C-\\><C-N><C-h>', { silent = true })
  vim.keymap.set('t', '<C-left>', '<C-\\><C-N><C-l>', { silent = true })
  vim.keymap.set('t', '<C-down>', '<C-\\><C-N><C-j>', { silent = true })
  vim.keymap.set('t', '<C-right>', '<C-\\><C-N><C-k>', { silent = true })
end

return M
