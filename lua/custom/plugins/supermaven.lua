return {
  'supermaven-inc/supermaven-nvim',
  event = 'InsertEnter',
  cmd = {
    'SupermavenStart',
    'SupermavenStop',
    'SupermavenRestart',
    'SupermavenToggle',
    'SupermavenStatus',
    'SupermavenUseFree',
    'SupermavenUsePro',
    'SupermavenLogout',
    'SupermavenShowLog',
    'SupermavenClearLog',
  },
  opts = {
    keymaps = {
      accept_suggestion = '<C-j>',
      accept_word = '<C-k>',
      clear_suggestion = '<C-]>',
    },
    ignore_filetypes = {
      snacks_input = true,
      snacks_notif = true,
    },
  },
}
