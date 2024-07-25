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
  -- stylua: ignore
  keys = function()
    return {
      { "]t", function() require("todo-comments").jump_next() end, desc = "Next [t]odo" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous [t]odo" },
      { "<leader>xt", "<cmd>Trouble todo toggle<cr>", desc = "[t]odo" },
      { "<leader>xT", "<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>", desc = "[T]odo/fix/fixme" },
      { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "[s]earch [t]odo" },
      { "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "[s]earch [T]odo/fix/fixme" },
    }
  end,
}
