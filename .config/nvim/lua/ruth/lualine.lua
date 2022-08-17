local lualine_status, lualine = pcall(require, 'lualine')

if not lualine_status then
  return
end

local theme

local color = vim.cmd[[color]]

if color == 'one' then
  theme = 'onedark'
elseif color == 'ayu-mirage' then
  theme = 'ayu-mirage'
end

lualine.setup {
  options = {
    theme = 'catppuccin',
    icons_enabled = true,
    component_separators = { left = '|', right = '|'},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {
      {
        'filename',
        path = 1,
      }
    },
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    -- lualine_b = {'filename', 'diagnostics'},
    -- lualine_c = {'filetype'},
  },
  winbar = {},
  inactive_winbar = {},
  extensions = {},
}
