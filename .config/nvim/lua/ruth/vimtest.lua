local vimtest_status, vimtest = pcall(require, 'vim-test')

if not vimtest_status then
  return
end

vimtest.setup {
  strategy = {
    nearest = 'neovim',
    file = 'neovim'
  },
  preserve_screen = 1
}
