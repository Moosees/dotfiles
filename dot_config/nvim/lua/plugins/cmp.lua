return {
  'hrsh7th/nvim-cmp',
  version = false, -- last release is way too old
  event = { 'InsertEnter', 'CmdlineEnter' },
  dependencies = {
    'folke/lazydev.nvim',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    {
      'garymjr/nvim-snippets',
      opts = { friendly_snippets = true },
      dependencies = { 'rafamadriz/friendly-snippets' },
    },
    { 'roobert/tailwindcss-colorizer-cmp.nvim', opts = {} },
    'lukas-reineke/cmp-under-comparator',
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
        completeopt = 'menu,menuone,noinsert'
          .. (auto_select and '' or ',noselect'),
      },
      preselect = auto_select and cmp.PreselectMode.Item
        or cmp.PreselectMode.None,
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
      sources = cmp.config.sources({
        { name = 'path' },
        { name = 'snippets', keyword_length = 2 },
        {
          name = 'nvim_lsp',
          keyword_length = 3,
          entry_filter = function(entry)
            -- return false for any kinds that should not show up
            -- see end of file for map of kinds
            -- vim.print(entry:get_kind())
            -- return entry:get_kind() ~= 15
            return true
          end,
        },
        {
          name = 'lazydev',
          group_index = 0,
        },
        -- {
        --   name = 'html-css',
        --   option = {
        --     style_sheets = {
        --       'https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css',
        --     },
        --   },
        -- },
      }, {
        {
          name = 'buffer',
          keyword_length = 3,
        },
      }),
      formatting = {
        format = function(entry, item)
          item = require('tailwindcss-colorizer-cmp').formatter(entry, item)

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

          item.menu = ({
            path = 'P',
            snippets = 'S',
            nvim_lsp = 'L',
            buffer = 'B',
            lazydev = 'D',
          })[entry.source.name]

          return item
        end,
      },
      experimental = {
        ghost_text = {
          hl_group = 'CmpGhostText',
        },
      },
      sorting = {
        -- https://github.com/hrsh7th/nvim-cmp/blob/main/lua/cmp/config/compare.lua
        comparators = {
          cmp.config.compare.exact,
          require('cmp-under-comparator').under,
          -- cmp.config.compare.offset,
          cmp.config.compare.recently_used,
          cmp.config.compare.scopes,
          cmp.config.compare.locality,
          cmp.config.compare.length,
          cmp.config.compare.score,
          cmp.config.compare.kind,
          -- cmp.config.compare.order,
          -- cmp.config.compare.sort_text,
        },
      },
    }
  end,
  main = 'lazyvim.util.cmp',
}

-- export const Text = 1;
-- export const Method = 2;
-- export const Function = 3;
-- export const Constructor = 4;
-- export const Field = 5;
-- export const Variable = 6;
-- export const Class = 7;
-- export const Interface = 8;
-- export const Module = 9;
-- export const Property = 10;
-- export const Unit = 11;
-- export const Value = 12;
-- export const Enum = 13;
-- export const Keyword = 14;
-- export const Snippet = 15;
-- export const Color = 16;
-- export const File = 17;
-- export const Reference = 18;
-- export const Folder = 19;
-- export const EnumMember = 20;
-- export const Constant = 21;
-- export const Struct = 22;
-- export const Event = 23;
-- export const Operator = 24;
-- export const TypeParameter = 25;
