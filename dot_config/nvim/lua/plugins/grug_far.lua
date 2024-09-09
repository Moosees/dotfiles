return {
  'MagicDuck/grug-far.nvim',
  keys = {
    { '<leader>sr', false },
    {
      '<leader>sR',
      function()
        local grug = require 'grug-far'
        local ext = vim.bo.buftype == '' and vim.fn.expand '%:e'
        grug.open {
          transient = true,
          prefills = {
            filesFilter = ext and ext ~= '' and '*.' .. ext or nil,
          },
        }
      end,
      mode = { 'n', 'v' },
      desc = '[s]earch and [R]eplace',
    },
    -- {
    --   '<leader>sR',
    --   '<leader>sr',
    --   mode = { 'n', 'v' },
    --   desc = 'Search and [R]eplace',
    -- },
  },
}
