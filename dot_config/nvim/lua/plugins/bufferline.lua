return {
  'akinsho/bufferline.nvim',
  event = 'VeryLazy',
  version = '*',
  dependencies = { 'nvim-tree/nvim-web-devicons', 'catppuccin/nvim' },
  keys = function()
    return {
      {
        '<leader>bp',
        '<Cmd>BufferLineTogglePin<CR>',
        desc = '[b]uffers toggle [p]in',
      },
      {
        '<leader>bP',
        '<Cmd>BufferLineGroupClose ungrouped<CR>',
        desc = '[b]uffers delete non-[P]inned',
      },
      {
        '<leader>bo',
        '<Cmd>BufferLineCloseOthers<CR>',
        desc = '[b]uffers delete [o]ther',
      },
      {
        '<leader>br',
        '<Cmd>BufferLineCloseRight<CR>',
        desc = '[buffers] delete to the [r]ight',
      },
      {
        '<leader>bl',
        '<Cmd>BufferLineCloseLeft<CR>',
        desc = '[b]uffers delete to the [l]eft',
      },
      { '<S-h>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
      { '<S-l>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
      { '[b', '<cmd>BufferLineMovePrev<cr>', desc = 'Move [b]uffer prev' },
      { ']b', '<cmd>BufferLineMoveNext<cr>', desc = 'Move [b]uffer next' },
    }
  end,
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
