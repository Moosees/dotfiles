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
    formatters = {
      ['markdown-toc'] = {
        condition = function(_, ctx)
          for _, line in ipairs(vim.api.nvim_buf_get_lines(ctx.buf, 0, -1, false)) do
            if line:find '<!%-%- toc %-%->' then
              return true
            end
          end
        end,
      },
      ['markdownlint-cli2'] = {
        condition = function(_, ctx)
          local diag = vim.tbl_filter(function(d)
            return d.source == 'markdownlint'
          end, vim.diagnostic.get(ctx.buf))
          return #diag > 0
        end,
      },
    },
    formatters_by_ft = {
      -- :help conform-formatters
      lua = { 'stylua' },
      -- Conform can also run multiple formatters sequentially
      -- python = { "isort", "black" },
      -- You can use a sub-list to tell conform to run *until* a formatter is found.
      -- javascript = { { 'prettierd', 'prettier' }, { 'eslint_d','eslint' } },
      -- javascript = { 'prettier', 'eslint' },
      -- javascriptreact = { 'prettier', 'eslint' },
      -- markdown = { 'markdownlint' },
      ['markdown'] = { 'prettier', 'markdownlint-cli2', 'markdown-toc' },
      ['markdown.mdx'] = { 'prettier', 'markdownlint-cli2', 'markdown-toc' },
      -- :ConformInfo for debugging
    },
  },
}
