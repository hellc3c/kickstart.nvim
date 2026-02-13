return {
  {
    'folke/tokyonight.nvim',
    priority = 1000,
    lazy = false,
    opts = { transparent = true },
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = false,
    priority = 1000,
    config = function()
      require('rose-pine').setup {
        style = { transparency = true },
      }
    end,
  },
  {
    'ellisonleao/gruvbox.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('gruvbox').setup {}
    end,
  },
}
