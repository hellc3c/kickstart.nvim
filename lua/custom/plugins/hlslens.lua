-- lua/plugins/hlslens.lua
return {
  'kevinhwang91/nvim-hlslens',
  event = 'VeryLazy',
  opts = function()
    local ok, hlslens = pcall(require, 'hlslens')
    if not ok then
      return
    end

    hlslens.setup {
      calm_down = true,
      nearest_only = false,
      nearest_float_when = 'auto', -- "auto" | "always"
      -- These are good defaults; keep it minimal and predictable
      override_lens = function(render, pos_list, nearest, idx, rel_idx)
        local lnum, col = unpack(pos_list[idx])
        local text
        if nearest then
          text = string.format('[%d/%d]', idx, #pos_list)
        else
          text = string.format(' %d/%d ', idx, #pos_list)
        end
        render.setVirt(0, lnum - 1, col - 1, { { text, 'HlSearchLens' } }, nearest)
      end,
    }

    -- Keymaps: keep your motion, then trigger lens update
    local function exec_and_lens(keys)
      return function()
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(keys, true, false, true), 'n', true)
        hlslens.start()
      end
    end

    local function with_lens(cmd)
      return function()
        vim.cmd(cmd)
        hlslens.start()
      end
    end

    -- Jump keys that should refresh lens
    vim.keymap.set('n', 'n', exec_and_lens 'n', { desc = 'Next search result (hlslens)' })
    vim.keymap.set('n', 'N', exec_and_lens 'N', { desc = 'Prev search result (hlslens)' })
    vim.keymap.set('n', '*', exec_and_lens '*', { desc = 'Search word forward (hlslens)' })
    vim.keymap.set('n', '#', exec_and_lens '#', { desc = 'Search word backward (hlslens)' })
    vim.keymap.set('n', 'g*', exec_and_lens 'g*', { desc = 'Search word forward (partial) (hlslens)' })
    vim.keymap.set('n', 'g#', exec_and_lens 'g#', { desc = 'Search word backward (partial) (hlslens)' })

    -- When clearing highlights, also clear lens
    vim.keymap.set({ 'n', 'x' }, '<Esc>', function()
      vim.cmd 'noh'
      hlslens.stop()
      return '<Esc>'
    end, { expr = true, silent = true, desc = 'Escape + clear search + stop hlslens' })

    -- Optional: keep lens updated when typing / searching
    vim.api.nvim_create_autocmd('CmdlineLeave', {
      pattern = { '/', '?' },
      callback = function()
        -- start only if there's a real search pattern
        if vim.fn.getreg '/' ~= '' then
          hlslens.start()
        end
      end,
    })

    -- Optional: if you use incsearch.nvim, this makes it cooperate well
    -- (No hard dependency; only applies if installed)
    pcall(function()
      local incsearch = require 'incsearch'
      local map = require('incsearch.config').map
      vim.keymap.set('n', '/', function()
        incsearch.setup {
          cmdline = {
            search = {
              incsearch = true,
            },
          },
        }
        return incsearch.noinc_mappings '/' -- keep behavior stable
      end, { expr = true })
      -- If you want native mapping helper:
      -- map({ "/": function() ... end })
    end)
  end,
}
