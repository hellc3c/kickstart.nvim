return {
  'nvimdev/dashboard-nvim',
  cond = function()
    return vim.fn.argc(-1) == 0
  end,
  event = 'VimEnter',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local logo = [[
      ___           ___           ___       ___       ___     
     /\__\         /\  \         /\__\     /\__\     /\  \    
    /:/  /        /::\  \       /:/  /    /:/  /    /::\  \   
   /:/__/        /:/\:\  \     /:/  /    /:/  /    /:/\:\  \  
  /::\  \ ___   /::\~\:\  \   /:/  /    /:/  /    /:/  \:\  \ 
 /:/\:\  /\__\ /:/\:\ \:\__\ /:/__/    /:/__/    /:/__/ \:\__\
 \/__\:\/:/  / \:\~\:\ \/__/ \:\  \    \:\  \    \:\  \  \/__/
      \::/  /   \:\ \:\__\    \:\  \    \:\  \    \:\  \      
      /:/  /     \:\ \/__/     \:\  \    \:\  \    \:\  \     
     /:/  /       \:\__\        \:\__\    \:\__\    \:\__\    
     \/__/         \/__/         \/__/     \/__/     \/__/    
]]

    require('dashboard').setup {
      config = {
        header = vim.split(logo, '\n'),
      },
    }
  end,
}
