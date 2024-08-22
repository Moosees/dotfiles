return {
  'monaqa/dial.nvim',
  keys = {
    {
      '<C-c>',
      '<C-a>',
      mode = { 'n', 'v' },
      desc = 'Increment',
    },
    {
      'g<C-c>',
      'g<C-a>',
      mode = { 'n', 'v' },
      desc = 'Increment',
    },
    { '<C-a>', false, mode = { 'n', 'v' } },
    { 'g<C-a>', false, mode = { 'n', 'v' } },
  },
}
