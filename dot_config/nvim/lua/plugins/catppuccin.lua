return {
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
          -- aerial = true,
          cmp = true,
          dashboard = true,
          flash = true,
          gitsigns = true,
          headlines = false,
          illuminate = { enabled = true, lsp = false },
          indent_blankline = { enabled = true, colored_indent_levels = true },
          -- leap = true,
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
          noice = false,
          notify = false,
          semantic_tokens = true,
          telescope = {
            enabled = true,
            --style = 'nvchad'
          },
          treesitter = true,
          treesitter_context = true,
          which_key = false,
        },
      }

      vim.cmd.colorscheme 'catppuccin' -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    end,
  },
}
