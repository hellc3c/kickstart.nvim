local M = {}

local themes = {
  { id = 'rose-pine', label = 'rose-pine', scheme = 'rose-pine' },
  { id = 'rose-pine-moon', label = 'rose-pine (moon)', scheme = 'rose-pine-moon' },
  { id = 'rose-pine-dawn', label = 'rose-pine (dawn)', scheme = 'rose-pine-dawn' },

  { id = 'tokyonight-night', label = 'tokyonight (night)', scheme = 'tokyonight-night' },
  { id = 'tokyonight-storm', label = 'tokyonight (storm)', scheme = 'tokyonight-storm' },
  { id = 'tokyonight-moon', label = 'tokyonight (moon)', scheme = 'tokyonight-moon' },
  { id = 'tokyonight-day', label = 'tokyonight (day)', scheme = 'tokyonight-day', background = 'light' },

  { id = 'gruvbox:dark', label = 'gruvbox (dark)', scheme = 'gruvbox', background = 'dark' },
  { id = 'gruvbox:light', label = 'gruvbox (light)', scheme = 'gruvbox', background = 'light' },
}

local function normalize(name)
  if type(name) ~= 'string' or name == '' then
    return nil
  end
  return name
end

local function build_index()
  local by_id = {}
  for _, t in ipairs(themes) do
    by_id[t.id] = t
  end
  return by_id
end

local function apply_background(bg)
  if bg == nil or bg == '' then
    return
  end
  if bg ~= 'dark' and bg ~= 'light' then
    return
  end
  vim.o.background = bg
end

function M.apply(name)
  local target = normalize(name) or normalize(vim.g.custom_theme) or 'rose-pine'
  local spec = build_index()[target]
  if not spec then
    spec = { id = target, scheme = target }
  end

  vim.g.custom_theme = spec.id
  apply_background(spec.background)
  pcall(vim.cmd.colorscheme, spec.scheme)
end

function M.pick()
  local items = themes

  vim.ui.select(items, {
    prompt = 'Colorscheme',
    format_item = function(item)
      return item.label
    end,
  }, function(choice)
    if choice and type(choice) == 'table' then
      M.apply(choice.id)
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
      return vim.tbl_keys(build_index())
    end,
  })
end

return M
