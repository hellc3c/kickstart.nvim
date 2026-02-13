return {
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {
      scope = {
        enabled = true,
        show_start = true,
        show_end = true,
        highlight = { 'Function', 'Label' },
      },
      exclude = {
        filetypes = { 'dashboard' },
      },
    },
    config = function(_, opts)
      local hooks = require 'ibl.hooks'
      hooks.register(hooks.type.SCOPE_HIGHLIGHT, function(_, _, scope, _)
        if scope and (scope:type() == 'if_statement' or scope:type() == 'for_statement') then
          return 2
        end
        return 1
      end)

      require('ibl').setup(opts)
    end,
  },
}
