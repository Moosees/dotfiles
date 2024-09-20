-- Keymaps are automatically loaded on the VeryLazy event - See `:help vim.keymap.set()`
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

vim.keymap.set('i', 'jk', '<escape>')

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous [d]iagnostic message' })
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next [d]iagnostic message' })
-- vim.keymap.set('n', '<leader>m', vim.diagnostic.open_float, { desc = 'Show diagnostic error [m]essages' })
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>.
-- This won't work in all terminal emulators/tmux/etc.
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode - change window size instead
vim.keymap.set('n', '<left>', ':vertical resize -5<cr>', { silent = true })
vim.keymap.set('n', '<right>', ':vertical resize +5<cr>', { silent = true })
vim.keymap.set('n', '<up>', ':resize +5<cr>', { silent = true })
vim.keymap.set('n', '<down>', ':resize -5<cr>', { silent = true })

-- Option key workaround
-- vim.keymap.set('n', '√', '<cmd>m .+1<cr>==', { desc = 'Move Down' })
-- vim.keymap.set('n', 'ª', '<cmd>m .-2<cr>==', { desc = 'Move Up' })
-- vim.keymap.set('i', '√', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move Down' })
-- vim.keymap.set('i', 'ª', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move Up' })
-- vim.keymap.set('v', '√', ":m '>+1<cr>gv=gv", { desc = 'Move Down' })
-- vim.keymap.set('v', 'ª', ":m '<-2<cr>gv=gv", { desc = 'Move Up' })

-- Use CTRL+<hjkl> to switch between windows - Set up with tmux navigator instead
-- See `:help wincmd` for a list of all window commands
-- vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Don't send x deletes to numbered regs
vim.keymap.set('n', 'x', '"_x')

-- No more quit all
vim.keymap.del('n', '<leader>qq')

-- No more save, use for cmp instead
vim.keymap.del('n', '<C-s>')
