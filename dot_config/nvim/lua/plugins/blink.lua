return {
  'saghen/blink.cmp',
  -- dependencies = { 'roobert/tailwindcss-colorizer-cmp.nvim', opts = {} },
  opts = {
    appearance = {
      -- sets the fallback highlight groups to nvim-cmp's highlight groups
      -- useful for when your theme doesn't support blink.cmp
      -- will be removed in a future release, assuming themes add support
      use_nvim_cmp_as_default = false,
    },
    completion = {
      accept = {
        -- experimental auto-brackets support
        auto_brackets = {
          enabled = true,
        },
      },
      menu = {
        draw = {
          treesitter = { 'lsp' },
        },
        -- cmp style menu
        -- columns = {
        --   { 'label', 'label_description', gap = 1 },
        --   { 'kind_icon', 'kind' },
        -- },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
      },
      -- 'prefix' will fuzzy match on the text before the cursor
      -- 'full' will fuzzy match on the text before *and* after the cursor
      -- example: 'foo_|_bar' will match 'foo_' for 'prefix' and 'foo__bar' for 'full'
      keyword = { range = 'prefix' },
    },

    -- experimental signature help support
    -- signature = { enabled = true },

    sources = {
      -- adding any nvim-cmp sources here will enable them
      -- with blink.compat
      compat = {},
      default = { 'lsp', 'path', 'snippets', 'buffer' },
      cmdline = {},
    },
    keymap = {
      ['<C-space>'] = {
        function(cmp)
          cmp.show { providers = { 'snippets' } }
        end,
      },
      ['<C-s>'] = {
        function(cmp)
          cmp.show { providers = { 'lsp', 'path', 'buffer' } }
        end,
      },
      ['<C-e>'] = { 'hide' },
    },
  },
}
