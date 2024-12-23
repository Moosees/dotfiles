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
      preset = 'classic',
    }

    wk.add {
      {
        mode = { 'n', 'v' },
        {
          '<leader>b',
          group = '[b]uffer',
          icon = { icon = '󰓩  ', color = 'azure' },
          expand = function()
            return require('which-key.extras').expand.buf()
          end,
        },
        {
          '<leader>w',
          group = '[w]indows',
          proxy = '<c-w>',
          icon = { icon = ' ', color = 'azure' },
          expand = function()
            return require('which-key.extras').expand.win()
          end,
        },
        -- stylua: ignore start
        { '<leader>c', group = '[c]ode', icon = { icon = '󰅩 ', color = 'azure' }, },
        { '<leader>f', group = '[f]ind/file', icon = { icon = ' ', color = 'azure' }, },
        { '<leader>g', group = '[g]it', icon = { icon = ' ', color = 'azure' }, },
        { '<leader>gh', group = '[h]unks', icon = { icon = ' ', color = 'azure' }, },
        { '<leader>p', group = '[p]ersitence', icon = { icon = '󰁯 ', color = 'azure' }, },
        { '<leader>r', group = '[r]efactor', icon = { icon = '󰘦 ', color = 'azure' }, },
        { '<leader>s', group = '[s]earch', icon = { icon = ' ', color = 'azure' }, },
        { '<leader>u', group = '[u]i', icon = { icon = '󱗖 ', color = 'azure' }, },
        { '<leader>x', group = 'Fi[x]/trouble', icon = { icon = '󱖫 ', color = 'azure' }, },
        { '<leader><tab>', group = '[Tab]s', icon = { icon = ' ', color = 'azure' }, },
        { 'gs', group = '[s]urround', icon = { icon = '󰅪 ', color = 'orange' } },
        { 'gc', group = '[c]omments', icon = { icon = ' ', color = 'orange' } },
        { 'gb', group = '[b]block comments', icon = { icon = ' ', color = 'orange' } },
        { 'gx', desc = 'Open with system app', icon = { icon = ' ', color = 'cyan' } },
        -- hidden keymaps
        {'<leader>l', hidden = true},
        {'<leader>L', hidden = true},
        {'<leader>`', hidden = true},
        {'<leader>-', hidden = true},
        {'<leader>|', hidden = true},
        {'<leader><space>', hidden = true},
      },
    }
  end,
}
