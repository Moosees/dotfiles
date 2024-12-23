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
}
