return {
  {
    'neovim/nvim-lspconfig',
    event = 'LazyFile',
    dependencies = {
      'mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      { 'j-hui/fidget.nvim', opts = {} }, -- LSP status UI in bottom right
    },
    opts = {
      -- options for vim.diagnostic.config()
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = 'if_many',
          prefix = '●',
          -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
          -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
          -- prefix = "icons",
        },
        severity_sort = true,
      },
      -- Enable this to enable the builtin LSP inlay hints on Neovim >= 0.10.0
      -- Be aware that you also will need to properly configure your LSP server to
      -- provide the inlay hints.
      inlay_hints = {
        enabled = true,
        exclude = { 'vue' }, -- filetypes for which you don't want to enable inlay hints
      },
      -- Enable this to enable the builtin LSP code lenses on Neovim >= 0.10.0
      -- Be aware that you also will need to properly configure your LSP server to
      -- provide the code lenses.
      codelens = {
        enabled = false,
      },
      -- Enable lsp cursor word highlighting
      document_highlight = {
        enabled = true,
      },
      -- add any global capabilities here
      capabilities = {
        workspace = {
          fileOperations = {
            didRename = true,
            willRename = true,
          },
        },
      },
      -- options for vim.lsp.buf.format
      -- `bufnr` and `filter` is handled by the LazyVim formatter,
      -- but can be also overridden when specified
      format = {
        formatting_options = nil,
        timeout_ms = nil,
      },
      -- LSP Server Settings
      servers = {
        -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
        --    https://github.com/pmizio/typescript-tools.nvim
        stylelint_lsp = {
          -- mason = false, -- set to false if you don't want this server to be installed with mason
          filetypes = { 'css', 'scss', 'less', 'sass' },
          -- root_dir = require('lspconfig').util.root_pattern(
          --   'package.json',
          --   '.git'
          -- ),
          settings = {
            stylelintplus = {
              -- see available options in stylelint-lsp documentation
            },
          },
          -- on_attach = function(client)
          --   client.server_capabilities.document_formatting = false
          -- end,
        },
      },
      setup = {},
      -- you can do any additional lsp server setup here
      -- return true if you don't want this server to be setup with lspconfig
    },
  },
  {
    'williamboman/mason.nvim',
    opts = {
      ensure_installed = {
        'emmet-language-server',
        'stylelint',
        'stylelint_lsp',
      },
    },
  },
}
