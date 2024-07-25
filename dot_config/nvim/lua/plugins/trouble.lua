return {
  'folke/trouble.nvim',
  cmd = { 'Trouble' },
  opts = {
    auto_close = true,
    -- pinned = true, -- not sure
    modes = {
      lsp = { -- LSP definitions, references, implementations, type definitions, and declarations
        win = { position = 'right', size = { width = 0.25 } },
      },
      symbols = {
        win = { position = 'right', size = { width = 0.25 } },
      },
    },
  },
  keys = function()
    return {
      { '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Workspace diagnosti[x]' },
      { '<leader>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', desc = 'Buffer diagnosi[X]' },
      -- { '<leader>xs', '<cmd>Trouble symbols toggle<cr>', desc = '[s]ymbols' },
      { '<leader>xS', '<cmd>Trouble lsp toggle<cr>', desc = 'L[S]P' },
      { '<leader>xL', '<cmd>Trouble loclist toggle<cr>', desc = '[L]ocations' },
      { '<leader>xQ', '<cmd>Trouble qflist toggle<cr>', desc = '[Q]uickfix' },
      {
        '[q',
        function()
          if require('trouble').is_open() then
            ---@diagnostic disable-next-line: missing-parameter, missing-fields
            require('trouble').prev { skip_groups = true, jump = true }
          else
            local ok, err = pcall(vim.cmd.cprev)
            if not ok then
              vim.notify(err, vim.log.levels.ERROR)
            end
          end
        end,
        desc = 'Prev trouble/[q]uickfix',
      },
      {
        ']q',
        function()
          if require('trouble').is_open() then
            ---@diagnostic disable-next-line: missing-parameter, missing-fields
            require('trouble').next { skip_groups = true, jump = true }
          else
            local ok, err = pcall(vim.cmd.cnext)
            if not ok then
              vim.notify(err, vim.log.levels.ERROR)
            end
          end
        end,
        desc = 'Next trouble/[q]uickfix',
      },
    }
  end,
}
