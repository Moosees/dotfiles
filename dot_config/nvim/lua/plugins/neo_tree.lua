return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  lazy = true,
  init = function()
    -- FIX: use `autocmd` for lazy-loading neo-tree instead of directly requiring it,
    -- because `cwd` is not set up properly.

    -- vim.api.nvim_create_autocmd('BufEnter', {
    --   group = vim.api.nvim_create_augroup('Neotree_start_directory', { clear = true }),
    --   desc = 'Start Neo-tree with directory',
    --   once = true,
    --   callback = function()
    --     if package.loaded['neo-tree'] then
    --       return
    --     else
    --       local stats = vim.uv.fs_stat(vim.fn.argv(0))
    --       if stats and stats.type == 'directory' then
    --         require 'neo-tree'
    --       end
    --     end
    --   end,
    -- })
  end,
  keys = function()
    return {
      { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal' },
      { '<leader>bn', ':Neotree buffers reveal<CR>', desc = '[b]uffers [n]eotree' },
      { '<leader>gn', ':Neotree git_status reveal<CR>', desc = '[g]it [n]eotree' },
    }
  end,
  opts = {
    close_if_last_window = false,
    enable_git_status = true,
    enable_diagnostics = true,
    hide_root_node = true,
    default_component_configs = {
      name = {
        trailing_slash = true,
        use_git_status_colors = true,
        highlight = 'NeoTreeFileName',
      },
      file_size = {
        enabled = true,
        required_width = 24,
      },
    },
    window = {
      position = 'float',
      width = 48,
      mappings = {
        ['<space>'] = {
          'toggle_node',
          nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
        },
        ['\\'] = 'close_window',
        ['-'] = 'open_split',
        ['|'] = 'open_vsplit',
        ['z'] = 'close_all_nodes',
        ['Z'] = 'expand_all_nodes',
      },
    },
    filesystem = {
      hijack_netrw_behaviour = 'disabled',
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_name = {
          'node_modules',
          '.git',
          '.DS_Store',
        },
      },
    },
  },
}
