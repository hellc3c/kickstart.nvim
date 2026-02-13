local M = {}

local themes = {
  { label = 'rose-pine', value = 'rose-pine' },
  { label = 'tokyonight-night', value = 'tokyonight-night' },
  { label = 'gruvbox', value = 'gruvbox' },
}

local function normalize(name)
  if type(name) ~= 'string' or name == '' then
    return nil
  end
  return name
end

function M.apply(name)
  local target = normalize(name) or normalize(vim.g.custom_theme) or 'rose-pine'
  vim.g.custom_theme = target
  pcall(vim.cmd.colorscheme, target)
end

function M.pick()
  local items = {}
  for _, t in ipairs(themes) do
    table.insert(items, t.value)
  end

  vim.ui.select(items, { prompt = 'Colorscheme' }, function(choice)
    if choice then
      M.apply(choice)
    end
  end)
end

function M.setup()
  vim.api.nvim_create_user_command('Theme', function(opts)
    if opts.args ~= '' then
      M.apply(opts.args)
      return
    end
    M.pick()
  end, {
    nargs = '?',
    complete = function()
      local out = {}
      for _, t in ipairs(themes) do
        table.insert(out, t.value)
      end
      return out
    end,
  })
end

return M
