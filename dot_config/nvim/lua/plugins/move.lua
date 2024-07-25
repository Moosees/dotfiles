return {
  'fedepujol/move.nvim',
  opts = {},
  config = function()
    require('move').setup {
      line = {
        enable = true, -- Enables line movement
        indent = true, -- Toggles indentation
      },
      block = {
        enable = true, -- Enables block movement
        indent = true, -- Toggles indentation
      },
      word = {
        enable = false, -- Enables word movement
      },
      char = {
        enable = true, -- Enables char movement
      },
    }

    local opts = { noremap = true, silent = true }

    vim.keymap.set('i', '√', '<esc>:MoveLine(1)<CR>i', opts)
    vim.keymap.set('i', 'ª', '<esc>:MoveLine(-1)<CR>i', opts)

    vim.keymap.set('n', '√', ':MoveLine(1)<CR>', opts)
    vim.keymap.set('n', 'ª', ':MoveLine(-1)<CR>', opts)
    vim.keymap.set('n', '˛', ':MoveHChar(-1)<CR>', opts)
    vim.keymap.set('n', 'ﬁ', ':MoveHChar(1)<CR>', opts)
    -- vim.keymap.set('n', '<leader>wf', ':MoveWord(1)<CR>', opts)
    -- vim.keymap.set('n', '<leader>wb', ':MoveWord(-1)<CR>', opts)

    vim.keymap.set('v', '√', ':MoveBlock(1)<CR>', opts)
    vim.keymap.set('v', 'ª', ':MoveBlock(-1)<CR>', opts)
    vim.keymap.set('v', '˛', ':MoveHBlock(-1)<CR>', opts)
    vim.keymap.set('v', 'ﬁ', ':MoveHBlock(1)<CR>', opts)
  end,
}
