return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  dependencies = { 'catppuccin/nvim' },
  config = function() -- This is the function that runs, AFTER loading
    vim.o.timeout = true
    vim.o.timeoutlen = 200

    local wk = require 'which-key'
    wk.setup {
      -- hidden = { '<silent>', '<cmd>', '<Cmd>', '<CR>', '^:', '^ ', '^call ', '^lua ' }, -- hide mapping boilerplate
      show_help = false, -- show a help message in the command line for using WhichKey
      show_keys = false, -- show the currently pressed key and its label as a message in the command line
    }

    wk.add {
      {
        mode = { 'n' },
        { '<leader>b', group = '[b]uffers' },
        { '<leader>c', group = '[c]ode', mode = { 'n', 'v' } },
        { '<leader>f', group = '[f]ind/file' },
        { '<leader>g', group = '[g]it' },
        { '<leader>h', group = 'Git [h]unk' },
        { '<leader>p', group = '[p]ersitence' },
        { '<leader>r', group = '[r]efactor' },
        { '<leader>s', group = '[s]earch' },
        { '<leader>u', group = '[u]til/toggle' },
        { '<leader>w', group = '[w]indow' },
        { '<leader>x', group = 'Fi[x] trouble' },
        { '<leader><tab>', group = '[Tab]s' },
        { 'gs', group = '[s]urround' },
        { 'gc', group = '[c]omments' },
        { 'gb', group = '[b]block comments' },
      },
      {
        mode = { 'v' },
        { '<leader>h', group = 'Git [h]unk' },
        { 'gs', group = '[s]urround' },
        { '<leader>s', group = '[s]earch' },
      },
    }
  end,
}
