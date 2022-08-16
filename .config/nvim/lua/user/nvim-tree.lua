local nvimtree_status, nvimtree = pcall(require, 'nvim-tree')

if not nvimtree_status then
  return
end

nvimtree.setup {
  disable_netrw = false,
  hijack_netrw = true,
  sort_by = 'case_sensitive',
  prefer_startup_root = false,
  sync_root_with_cwd = false,
  reload_on_bufenter = false,
  respect_buf_cwd = false,
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  update_focused_file = {
    enable = true,
    update_root = false,
  },
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
    show_on_dirs = true,
  },
  view = {
    adaptive_size = true,
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = "left",
    number = false,
    relativenumber = false,
  },
  actions = {
    open_file = {
      resize_window = true
    },
  },
  remove_keymaps = {
    '<C-t>'
  },
}
