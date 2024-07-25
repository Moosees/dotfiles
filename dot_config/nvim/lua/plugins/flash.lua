return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  ---@type Flash.Config
  opts = {
    search = {
      mode = 'fuzzy',
      -- mode = 'exact',
    },
  },
  keys = function()
    return {
      {
        's',
        mode = { 'n', 'x', 'o' },
        function()
          require('flash').jump()
        end,
        desc = 'Fla[s]h',
      },
      {
        'S',
        mode = { 'n', 'x', 'o' },
        function()
          require('flash').treesitter()
        end,
        desc = 'Fla[S]h treesitter',
      },
      -- { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      {
        'r',
        mode = { 'o', 'x' },
        function()
          require('flash').treesitter_search()
        end,
        desc = 'T[r]eesitter search',
      },
      -- { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    }
  end,
}
