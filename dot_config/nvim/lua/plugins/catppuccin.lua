return {
  {
    'folke/tokyonight.nvim',
    enabled = false,
  },
  {
    'LazyVim/LazyVim',
    opts = {
      colorscheme = 'catppuccin',
    },
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      require('catppuccin').setup {
        flavour = 'mocha', -- latte, frappe, macchiato, mocha
        background = { -- :h background
          light = 'latte',
          dark = 'mocha',
        },
        transparent_background = false,
        show_end_of_buffer = true,
        integrations = {
          aerial = true,
          blink_cmp = true,
          flash = true,
          fzf = true,
          gitsigns = true,
          illuminate = { enabled = true, lsp = false },
          lsp_trouble = false,
          mason = true,
          markdown = true,
          mini = { enabled = true },
          native_lsp = {
            enabled = true,
            virtual_text = {
              errors = { 'italic' },
              hints = { 'italic' },
              warnings = { 'italic' },
              information = { 'italic' },
              ok = { 'italic' },
            },
            underlines = {
              errors = { 'underline' },
              hints = { 'underline' },
              warnings = { 'underline' },
              information = { 'underline' },
              ok = { 'underline' },
            },
            inlay_hints = {
              background = true,
            },
          },
          -- neotest = false,
          neotree = false,
          noice = true,
          snacks = true,
          treesitter = true,
          treesitter_context = true,
          which_key = false,
        },
      }
    end,
  },
}
