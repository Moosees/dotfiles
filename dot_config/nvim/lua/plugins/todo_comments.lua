return {
  'folke/todo-comments.nvim',
  cmd = { 'TodoTrouble', 'TodoTelescope' },
  event = 'VimEnter',
  dependencies = { 'nvim-lua/plenary.nvim' },
  -- TODO: do stuff
  -- FIX: fix stuff
  -- BUG:
  -- HACK:
  -- WARN:
  -- PERF:
  -- NOTE:
  -- TEST:
  opts = {
    signs = false,
    highlight = {
      keyword = 'bg',
      before = 'fg',
    },
  },
}
