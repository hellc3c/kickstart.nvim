return {
  'folke/snacks.nvim',
  priority = 1000,
  event = 'BufReadPost',
  opts = {
    bigfile = { enabled = true },
    indent = {
      enabled = false,
      only_scope = true,
      only_current = true,
      indent = { char = '▏' },
      scope = {
        enabled = true,
        underline = true,
        char = '▏',
        hl = 'Function',
      },
    },
    input = { enabled = true },
    scope = { enabled = true },
  },
}
