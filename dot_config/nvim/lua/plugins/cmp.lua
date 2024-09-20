return {
  'hrsh7th/nvim-cmp',
  version = false, -- last release is way too old
  event = { 'InsertEnter', 'CmdlineEnter' },
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    { 'garymjr/nvim-snippets', opts = { friendly_snippets = true }, dependencies = { 'rafamadriz/friendly-snippets' } },
    { 'roobert/tailwindcss-colorizer-cmp.nvim', opts = {} },
  },
  opts = function()
    vim.api.nvim_set_hl(0, 'CmpGhostText', { link = 'Comment', default = true })
    local cmp = require 'cmp'
    local auto_select = true
    return {
      -- Not all LSP servers add brackets when completing a function.
      -- To better deal with this, LazyVim adds a custom option to cmp,
      -- that you can configure. For example: auto_brackets = { "python" }
      auto_brackets = {}, -- configure any filetype to auto add brackets
      completion = {
        completeopt = 'menu,menuone,noinsert' .. (auto_select and '' or ',noselect'),
      },
      preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,
      mapping = cmp.mapping.preset.insert {
        -- For an understanding of why these mappings were chosen, you will need to read `:help ins-completion`
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-s>'] = cmp.mapping.complete(),
        ['<C-y>'] = LazyVim.cmp.confirm { select = auto_select },
        ['<C-e>'] = cmp.mapping.abort(),
        -- ['<S-CR>'] = LazyVim.cmp.confirm { behavior = cmp.ConfirmBehavior.Replace }, -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        -- ['<C-CR>'] = function(fallback)
        --   cmp.abort()
        --   fallback()
        -- end,
      },
      sources = cmp.config.sources({ { name = 'nvim_lsp' }, { name = 'path' }, { name = 'snippets' } }, { { name = 'buffer' } }),
      formatting = {
        format = function(_, item)
          local icons = LazyVim.config.icons.kinds
          if icons[item.kind] then
            item.kind = icons[item.kind] .. item.kind
          end

          local widths = {
            abbr = vim.g.cmp_widths and vim.g.cmp_widths.abbr or 40,
            menu = vim.g.cmp_widths and vim.g.cmp_widths.menu or 30,
          }

          for key, width in pairs(widths) do
            if item[key] and vim.fn.strdisplaywidth(item[key]) > width then
              item[key] = vim.fn.strcharpart(item[key], 0, width - 1) .. '…'
            end
          end

          return item
        end,
      },
      experimental = {
        ghost_text = {
          hl_group = 'CmpGhostText',
        },
      },
      sorting = {
        comparators = {
          cmp.config.compare.offset,
          cmp.config.compare.exact,
          cmp.config.compare.score,
          cmp.config.compare.recently_used,
          cmp.config.compare.locality,
          cmp.config.compare.kind,
          cmp.config.compare.sort_text,
          cmp.config.compare.length,
          cmp.config.compare.order,
        },
      },
    }
  end,
  main = 'lazyvim.util.cmp',
}
