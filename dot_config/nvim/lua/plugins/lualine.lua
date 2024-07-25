return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons', 'catppuccin/nvim' },
  event = 'VeryLazy',

  opts = function()
    local function isRecording()
      local reg = vim.fn.reg_recording()
      if reg == '' then
        return ''
      end
      return 'recording: ' .. reg
    end

    return {
      options = {
        theme = 'catppuccin',
        always_divide_middle = true,
        component_separators = { left = '|', right = '|' },
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = { { 'mode', separator = { left = '' }, right_padding = 1 } },
        lualine_b = { 'searchcount', 'selectioncount', 'branch', 'diagnostics', { 'filename', path = 1 } },
        lualine_c = { '%=' },
        lualine_x = {},
        lualine_y = { isRecording, 'filetype', 'filesize', 'progress' },
        lualine_z = {
          { 'location', separator = { right = '' }, left_padding = 1 },
        },
      },
      inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
      },
      tabline = {},
      extensions = {},
    }
  end,
}
