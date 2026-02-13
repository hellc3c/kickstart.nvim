local M = {}

function M.setup()
  local python_group = vim.api.nvim_create_augroup('custom-python-keymaps', { clear = true })
  vim.api.nvim_create_autocmd('FileType', {
    group = python_group,
    pattern = 'python',
    callback = function(event)
      vim.keymap.set('n', '<C-s>', ':!black % && isort %<CR>', { buffer = event.buf, silent = true, desc = 'Format: black+isort' })
      vim.keymap.set('n', '<leader>i', ':!isort --profile black %<CR>', { buffer = event.buf, silent = true, desc = 'Imports: isort' })
    end,
  })

  local terminal_group = vim.api.nvim_create_augroup('custom-terminal-mode', { clear = true })
  vim.api.nvim_create_autocmd({ 'BufWinEnter', 'WinEnter' }, {
    group = terminal_group,
    pattern = 'term://*',
    command = 'startinsert',
  })

  vim.api.nvim_create_user_command('Vterm', function()
    vim.cmd [[
      vsplit
      term
      startinsert
    ]]
  end, {})
end

return M
