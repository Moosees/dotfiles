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
          group = 'Buffer',
          icon = { icon = '󰓩  ', color = 'azure' },
          expand = function()
            return require('which-key.extras').expand.buf()
          end,
        },
        {
          '<leader>w',
          group = 'Windows',
          proxy = '<c-w>',
          icon = { icon = ' ', color = 'azure' },
          expand = function()
            return require('which-key.extras').expand.win()
          end,
        },
        -- stylua: ignore start
        { '<leader>c', group = 'Code', icon = { icon = '󰅩 ', color = 'azure' }, },
        { '<leader>d', group = 'Debug', icon = { icon = ' ', color = 'azure' }, },
        { '<leader>f', group = 'File', icon = { icon = ' ', color = 'azure' }, },
        { '<leader>g', group = 'Git', icon = { icon = ' ', color = 'azure' }, },
        { '<leader>gh', group = 'Hunks', icon = { icon = ' ', color = 'azure' }, },
        { '<leader>p', group = 'Persistence', icon = { icon = '󰁯 ', color = 'azure' }, },
        { '<leader>r', group = 'Refactor', icon = { icon = '󰘦 ', color = 'azure' }, },
        { '<leader>s', group = 'Search', icon = { icon = ' ', color = 'azure' }, },
        { '<leader>u', group = 'Ui', icon = { icon = '󱗖 ', color = 'azure' }, },
        { '<leader>x', group = 'Fix/trouble', icon = { icon = '󱖫 ', color = 'azure' }, },
        { '<leader><tab>', group = 'Tabs', icon = { icon = ' ', color = 'azure' }, },
        { 'gs', group = 'Surround', icon = { icon = '󰅪 ', color = 'orange' } },
        { 'gc', group = 'Comments', icon = { icon = ' ', color = 'orange' } },
        { 'gb', group = 'Block comments', icon = { icon = ' ', color = 'orange' } },
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
