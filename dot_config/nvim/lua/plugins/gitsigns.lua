return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end

        -- stylua: ignore start
        -- map('n', ']c', function()
        map("n", "]h", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            gs.nav_hunk("next")
          end
        end, "Next Hunk")
        map("n", "[h", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            gs.nav_hunk("prev")
          end
        end, "Prev Hunk")
        map("n", "]H", function() gs.nav_hunk("last") end, "Last Hunk")
        map("n", "[H", function() gs.nav_hunk("first") end, "First Hunk")
        map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
        map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
        map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
        map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
        map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
        map("n", "<leader>ghp", gs.preview_hunk_inline, "Preview Hunk Inline")
        map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
        map("n", "<leader>ghB", function() gs.blame() end, "Blame Buffer")
        map("n", "<leader>ghd", gs.diffthis, "Diff This")
        map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
      end,
    },
  },
}

-- OLD CONFIG
-- Navigation
-- map('n', ']c', function()
--   if vim.wo.diff then
--     vim.cmd.normal { ']c', bang = true }
--   else
--     gitsigns.nav_hunk 'next'
--   end
-- end, { desc = 'Jump to next git [c]hange' })
--
-- map('n', '[c', function()
--   if vim.wo.diff then
--     vim.cmd.normal { '[c', bang = true }
--   else
--     gitsigns.nav_hunk 'prev'
--   end
-- end, { desc = 'Jump to previous git [c]hange' })
--
-- -- Actions
-- -- visual mode
-- map('v', '<leader>hs', function()
--   gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
-- end, { desc = 'Git [h]unk [s]tage' })
-- map('v', '<leader>hr', function()
--   gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
-- end, { desc = 'Git [h]unk [r]eset' })
-- -- normal mode
-- -- stylua: ignore start
-- map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'Git [h]unk [s]tage' })
-- map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'Git [h]unk [r]eset' })
-- map('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'Git [h]unk [S]tage buffer' })
-- map('n', '<leader>hu', gitsigns.undo_stage_hunk, { desc = 'Git [h]unk [u]ndo stage' })
-- map('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'Git [h]unk [R]eset buffer' })
-- map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'Git [h]unk [p]review' })
-- map('n', '<leader>hb', gitsigns.blame_line, { desc = 'Git [h]unk [b]lame line' })
-- map('n', '<leader>hd', gitsigns.diffthis, { desc = 'Git [h]unk [d]iff against index' })
-- map('n', '<leader>hD', function()
--   gitsigns.diffthis '@'
-- end, { desc = 'Git [h]unk [D]iff against last commit' })
-- -- Toggles
-- map('n', '<leader>uB', gitsigns.toggle_current_line_blame, { desc = 'Toggle git blame' })
-- map('n', '<leader>uD', gitsigns.toggle_deleted, { desc = 'Toggle git show Deleted' })
--
