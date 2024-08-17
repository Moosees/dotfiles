return {
  'olrtg/nvim-emmet',
  config = function()
    vim.keymap.set({ 'n', 'v' }, '<leader>rw', require('nvim-emmet').wrap_with_abbreviation, { desc = 'Wrap with abbreviation' })
  end,
}
