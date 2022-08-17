local telescope_status, telescope = pcall(require, 'telescope')

if not telescope_status then
  return
end

local actions = require "telescope.actions"
local layout_actions = require "telescope.actions.layout"

telescope.setup{
  defaults = {
    prompt_prefix = "  ",
    path_display = {
      truncate = 3
    },
    sorting_strategy = "descending",
    color_devicons = true,
    border = {},
    borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
    winblend = 5,
    mappings = {
      i = {
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,

        ["<C-l>"] = layout_actions.toggle_preview,
        ["<Tab>"] = actions.toggle_selection + actions.move_selection_next,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_previous,

      }
    }
  },
  extensions = {
    project = {
      hidden_files = false,
    },
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    }
  }
}

telescope.load_extension('fzf')
