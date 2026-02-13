return {
  -- 主插件
  'milanglacier/minuet-ai.nvim',
  enabled = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  event = 'BufReadPre',
  opts = {
    provider = 'openai_fim_compatible',
    n_completions = 1,
    add_single_line_entry = false,
    virtualtext = {
      auto_trigger_ft = { 'lua', 'python' },
      keymap = {
        -- accept whole completion
        accept = '<right>',
      },
    },
    provider_options = {
      openai_fim_compatible = {
        -- 注意：这里的 api_key 是「环境变量名」，不是实际 key
        -- 需要在 shell 里导出： export DEEPSEEK_API_KEY=xxxx
        api_key = 'DEEPSEEK_API_KEY',
        name = 'deepseek',
        optional = {
          max_tokens = 256,
          top_p = 0.9,
        },
      },
    },
    openai_compatible = {
      api_key = 'OPENROUTER_API_KEY',
      end_point = 'https://openrouter.ai/api/v1/chat/completions',
      model = 'x-ai/grok-4.1-fast',
      name = 'Openrouter',
      optional = {
        max_tokens = 256,
        top_p = 0.9,
        provider = {
          -- Prioritize throughput for faster completion
          sort = 'throughput',
        },
      },
    },
  },
}
