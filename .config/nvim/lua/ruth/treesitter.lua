require'nvim-treesitter.configs'.setup {
  ensure_installed = 'all',
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
  autotag = {
    enable = true
  },
  indent = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  }
}
