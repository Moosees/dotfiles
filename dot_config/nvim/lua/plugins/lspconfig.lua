return {
  {
    'neovim/nvim-lspconfig',
    event = 'LazyFile',
    dependencies = {
      'mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      { 'j-hui/fidget.nvim', opts = {} }, -- LSP status UI in bottom right
      { 'folke/neodev.nvim', enabled = false },
      { -- replaces folke/neodev
        'folke/lazydev.nvim',
        ft = 'lua', -- only load on lua files
        cmd = 'LazyDev',
        opts = {
          library = {
            { path = 'luvit-meta/library', words = { 'vim%.uv' } },
            { path = 'LazyVim', words = { 'LazyVim' } },
            { path = 'lazy.nvim', words = { 'LazyVim' } },
          },
        },
      },
      { 'Bilal2453/luvit-meta', lazy = true }, -- optional `vim.uv` typings
      {
        'hrsh7th/nvim-cmp',
        opts = function(_, opts)
          table.insert(opts.sources, { name = 'lazydev', group_index = 0 })
        end,
      },
      { 'b0o/SchemaStore.nvim', version = false, lazy = true },
    },
    opts = function()
      return {
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
          signs = {
            text = {
              [vim.diagnostic.severity.ERROR] = LazyVim.config.icons.diagnostics.Error,
              [vim.diagnostic.severity.WARN] = LazyVim.config.icons.diagnostics.Warn,
              [vim.diagnostic.severity.HINT] = LazyVim.config.icons.diagnostics.Hint,
              [vim.diagnostic.severity.INFO] = LazyVim.config.icons.diagnostics.Info,
            },
          },
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
          lua_ls = {
            -- mason = false, -- set to false if you don't want this server to be installed with mason
            settings = {
              Lua = {
                workspace = {
                  checkThirdParty = false,
                },
                codeLens = {
                  enable = true,
                },
                completion = {
                  callSnippet = 'Replace',
                },
                doc = {
                  privateName = { '^_' },
                },
                hint = {
                  enable = true,
                  setType = false,
                  paramType = true,
                  paramName = 'Disable',
                  semicolon = 'Disable',
                  arrayIndex = 'Disable',
                },
              },
            },
          },
          jsonls = {
            -- lazy-load schemastore when needed
            on_new_config = function(new_config)
              new_config.settings.json.schemas = new_config.settings.json.schemas or {}
              vim.list_extend(new_config.settings.json.schemas, require('schemastore').json.schemas())
            end,
            settings = {
              json = {
                format = {
                  enable = true,
                },
                validate = { enable = true },
              },
            },
          },
          -- yaml = {
          --   schemaStore = {
          --     -- You must disable built-in schemaStore support if you want to use
          --     -- this plugin and its advanced options like `ignore`.
          --     enable = false,
          --     -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
          --     url = '',
          --   },
          --   schemas = require('schemastore').yaml.schemas(),
          -- },
          eslint = {
            settings = {
              -- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
              workingDirectories = { mode = 'auto' },
            },
          },
          marksman = {},
          tsserver = {
            enabled = false,
          },
          vtsls = {
            -- explicitly add default filetypes, so that we can extend them in related extras
            filetypes = {
              'javascript',
              'javascriptreact',
              'javascript.jsx',
              'typescript',
              'typescriptreact',
              'typescript.tsx',
            },
            settings = {
              complete_function_calls = true,
              vtsls = {
                enableMoveToFileCodeAction = true,
                autoUseWorkspaceTsdk = true,
                experimental = {
                  completion = {
                    enableServerSideFuzzyMatch = true,
                  },
                },
              },
              typescript = {
                updateImportsOnFileMove = { enabled = 'always' },
                suggest = {
                  completeFunctionCalls = true,
                },
                inlayHints = {
                  enumMemberValues = { enabled = true },
                  functionLikeReturnTypes = { enabled = true },
                  parameterNames = { enabled = 'literals' },
                  parameterTypes = { enabled = true },
                  propertyDeclarationTypes = { enabled = true },
                  variableTypes = { enabled = false },
                },
              },
            },
            keys = {
              {
                'gD',
                function()
                  local params = vim.lsp.util.make_position_params()
                  LazyVim.lsp.execute {
                    command = 'typescript.goToSourceDefinition',
                    arguments = { params.textDocument.uri, params.position },
                    open = true,
                  }
                end,
                desc = '[g]oto Source [D]efinition',
              },
              {
                'gR',
                function()
                  LazyVim.lsp.execute {
                    command = 'typescript.findAllFileReferences',
                    arguments = { vim.uri_from_bufnr(0) },
                    open = true,
                  }
                end,
                desc = '[g]oto File [R]eferences',
              },
              {
                '<leader>co',
                LazyVim.lsp.action['source.organizeImports'],
                desc = '[o]rganize Imports',
              },
              -- {
              --   '<leader>cM',
              --   LazyVim.lsp.action['source.addMissingImports.ts'],
              --   desc = 'Add missing imports',
              -- },
              -- {
              --   '<leader>cu',
              --   LazyVim.lsp.action['source.removeUnused.ts'],
              --   desc = 'Remove unused imports',
              -- },
              {
                '<leader>cD',
                LazyVim.lsp.action['source.fixAll.ts'],
                desc = 'Fix all [D]iagnostics',
              },
              {
                '<leader>cV',
                function()
                  LazyVim.lsp.execute { command = 'typescript.selectTypeScriptVersion' }
                end,
                desc = 'Select TS workspace [V]ersion',
              },
            },
          },
        },
        -- you can do any additional lsp server setup here
        -- return true if you don't want this server to be setup with lspconfig
        setup = {
          -- Specify * to use this function as a fallback for any server
          -- ["*"] = function(server, opts) end,
          eslint = function()
            local function get_client(buf)
              return LazyVim.lsp.get_clients({ name = 'eslint', bufnr = buf })[1]
            end

            local formatter = LazyVim.lsp.formatter {
              name = 'eslint: lsp',
              primary = false,
              priority = 200,
              filter = 'eslint',
            }

            -- Use EslintFixAll on Neovim < 0.10.0
            if not pcall(require, 'vim.lsp._dynamic') then
              formatter.name = 'eslint: EslintFixAll'
              formatter.sources = function(buf)
                local client = get_client(buf)
                return client and { 'eslint' } or {}
              end
              formatter.format = function(buf)
                local client = get_client(buf)
                if client then
                  local diag = vim.diagnostic.get(buf, { namespace = vim.lsp.diagnostic.get_namespace(client.id) })
                  if #diag > 0 then
                    vim.cmd 'EslintFixAll'
                  end
                end
              end
            end

            -- register the formatter with LazyVim
            LazyVim.format.register(formatter)
          end,
          tsserver = function()
            -- disable tsserver
            return true
          end,
          vtsls = function(_, opts)
            LazyVim.lsp.on_attach(function(client, buffer)
              client.commands['_typescript.moveToFileRefactoring'] = function(command, ctx)
                local action, uri, range = unpack(command.arguments)

                local function move(newf)
                  client.request('workspace/executeCommand', {
                    command = command.command,
                    arguments = { action, uri, range, newf },
                  })
                end

                local fname = vim.uri_to_fname(uri)
                client.request('workspace/executeCommand', {
                  command = 'typescript.tsserverRequest',
                  arguments = {
                    'getMoveToRefactoringFileSuggestions',
                    {
                      file = fname,
                      startLine = range.start.line + 1,
                      startOffset = range.start.character + 1,
                      endLine = range['end'].line + 1,
                      endOffset = range['end'].character + 1,
                    },
                  },
                }, function(_, result)
                  local files = result.body.files
                  table.insert(files, 1, 'Enter new path...')
                  vim.ui.select(files, {
                    prompt = 'Select move destination:',
                    format_item = function(f)
                      return vim.fn.fnamemodify(f, ':~:.')
                    end,
                  }, function(f)
                    if f and f:find '^Enter new path' then
                      vim.ui.input({
                        prompt = 'Enter move destination:',
                        default = vim.fn.fnamemodify(fname, ':h') .. '/',
                        completion = 'file',
                      }, function(newf)
                        return newf and move(newf)
                      end)
                    elseif f then
                      move(f)
                    end
                  end)
                end)
              end
            end, 'vtsls')
            -- copy typescript settings to javascript
            opts.settings.javascript = vim.tbl_deep_extend('force', {}, opts.settings.typescript, opts.settings.javascript or {})
          end,
        },
      }
    end,
  },
  {
    'williamboman/mason.nvim',
    opts = {
      ensure_installed = {
        'stylua',
        -- 'shfmt',
        -- 'prettierd',
        'prettier',
        'eslint_d',
        'json-lsp',
        'markdownlint-cli2',
        'markdown-toc',
        'js-debug-adapter',
      },
    },
  },
}
