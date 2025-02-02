--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used) See `:help mapleader`
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- Options are automatically loaded before lazy.nvim startup - See `:help vim.opt` or `:help option-list`
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
vim.g.have_nerd_font = true

-- LazyVim auto format
vim.g.autoformat = true

-- Snacks animations
-- Set to `false` to globally disable all snacks animations
vim.g.snacks_animate = false

-- if the completion engine supports the AI source,
-- use that instead of inline suggestions
vim.g.ai_cmp = true

-- LazyVim root dir detection
-- Each entry can be:
-- * the name of a detector function like `lsp` or `cwd`
-- * a pattern or array of patterns like `.git` or `lua`.
-- * a function with signature `function(buf) -> string|string[]`
vim.g.root_spec = { 'lsp', { '.git', 'lua' }, 'cwd' }

-- Optionally setup the terminal to use
-- This sets `vim.o.shell` and does some additional configuration for:
-- * pwsh
-- * powershell
-- LazyVim.terminal.setup("pwsh")

-- Set LSP servers to be ignored when used with `util.root.detectors.lsp`
-- for detecting the LSP root
vim.g.root_lsp_ignore = { 'copilot' }

-- Hide deprecation warnings
vim.g.deprecation_warnings = false

-- Show the current document symbols location from Trouble in lualine
-- You can disable this for a buffer by setting `vim.b.trouble_lualine = false`
vim.g.trouble_lualine = false

-- Enable the option to require a Prettier config file
-- If no prettier config file is found, the formatter will not be used
vim.g.lazyvim_prettier_needs_config = true

local opt = vim.opt

-- Defaults
opt.number = true -- Print line number
opt.relativenumber = true -- Relative line numbers
opt.backspace = { 'start', 'eol', 'indent' }
opt.scrolloff = 12 -- Lines of context - 4? 12?
opt.sidescrolloff = 8 -- Columns of context
opt.tabstop = 2 -- Number of spaces tabs count for
opt.wrap = false -- Disable line wrap
opt.linebreak = true -- Wrap lines at convenient points
opt.shiftround = true -- Round indent
opt.shiftwidth = 2 -- Size of an indent
opt.expandtab = true -- Use spaces instead of tabs

-- Don't show the mode, since it's already in the status line
opt.showmode = false

-- See `:help 'clipboard'`
opt.clipboard = '' -- disable clipboard sync

-- Save undo history
opt.undofile = true
opt.undolevels = 10000

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
opt.ignorecase = true
opt.smartcase = true

opt.signcolumn = 'yes' -- Always show the signcolumn, otherwise it would shift the text each time

-- Decrease update time
opt.updatetime = 250

-- Configure how new splits should be opened
opt.splitright = true -- Put new windows right of current
opt.splitbelow = true -- Put new windows below current
opt.splitkeep = 'cursor' -- 'screen'

-- See `:help 'list'` and `:help 'listchars'`
opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
opt.inccommand = 'split' -- nosplit

-- Every wrapped line will continue visually indented (same amount of
-- space as the beginning of that line), thus preserving horizontal blocks
-- of text.
opt.breakindent = true

-- Highlight the text line of the cursor with CursorLine |hl-CursorLine|.
-- Useful to easily spot the cursor.  Will make screen redrawing slower.
-- When Visual mode is active the highlighting isn't used to make it
-- easier to see the selected text.
opt.cursorline = true

-- Lazy stuff maybe change
opt.autowrite = true -- Enable auto write
opt.completeopt = 'menu,menuone,noselect'
opt.conceallevel = 2 -- Hide * markup for bold and italic, but not markers with substitutions
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.formatexpr = "v:lua.require'lazyvim.util'.format.formatexpr()"
opt.formatoptions = 'jcroqlnt' -- tcqj
opt.grepformat = '%f:%l:%c:%m'
opt.grepprg = 'rg --vimgrep'
opt.jumpoptions = 'view'
opt.laststatus = 3 -- global statusline
opt.mouse = 'a'
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.ruler = false -- Disable the default ruler
opt.sessionoptions = {
  'buffers',
  'curdir',
  'tabpages',
  'winsize',
  'help',
  'globals',
  'skiprtp',
  'folds',
}
opt.shortmess:append { W = true, I = true, c = true, C = true }
opt.smartindent = true -- Insert indents automatically
opt.spelllang = { 'en' }
opt.statuscolumn = [[%!v:lua.require'snacks.statuscolumn'.get()]]
opt.termguicolors = true -- True color support
opt.timeoutlen = vim.g.vscode and 1000 or 300 -- Lower than default (1000) to quickly trigger which-key
opt.virtualedit = 'block' -- Allow cursor to move where there is no text in visual block mode
opt.wildmode = 'longest:full,full' -- Command-line completion mode
