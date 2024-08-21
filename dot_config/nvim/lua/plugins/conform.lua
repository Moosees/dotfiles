return { -- Autoformat
  'stevearc/conform.nvim',
  lazy = true,
  -- keys = {
  --   {
  --     '<leader>F',
  --     function()
  --       require('conform').format { async = true, lsp_fallback = true }
  --     end,
  --     mode = '',
  --     desc = 'Con[F]orm buffer',
  --   },
  -- },

  opts = {
    -- Set the log level. Use `:ConformInfo` to see the location of the log file.
    log_level = vim.log.levels.ERROR,
    -- Conform will notify you when a formatter errors
    notify_on_error = true,
    formatters_by_ft = {
      -- :help conform-formatters
      lua = { 'stylua' },
      -- Conform can also run multiple formatters sequentially
      -- python = { "isort", "black" },
      -- You can use a sub-list to tell conform to run *until* a formatter is found.
      -- javascript = { { 'prettierd', 'prettier' }, { 'eslint_d','eslint' } },
      -- javascript = { 'prettier', 'eslint' },
      -- javascriptreact = { 'prettier', 'eslint' },
      -- :ConformInfo for debugging
    },
  },
}
