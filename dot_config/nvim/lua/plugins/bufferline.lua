return {
  'akinsho/bufferline.nvim',
  event = 'VeryLazy',
  -- version = '*',
  dependencies = { 'nvim-tree/nvim-web-devicons', 'catppuccin/nvim' },
  keys = {
    {
      '<leader>bo',
      '<Cmd>BufferLineCloseOthers<CR>',
      desc = 'Delete Other Buffers',
    },
  },
  opts = {
    options = {
      mode = 'buffers',
      themable = true,
      always_show_bufferline = true,
      show_buffer_close_icons = false,
      show_close_icon = false,
      offsets = {
        {
          filetype = 'neo-tree',
          text = ' ',
        },
      },
      -- separator_style = { '', '' },
      highlights = require('catppuccin.groups.integrations.bufferline').get(),
      -- highlights = {
      -- background = {
      --   bg = '#1e1e2e',
      -- },
      -- fill = {
      --   bg = '#1e1e2e',
      -- },
      -- },
    },
  },
}
