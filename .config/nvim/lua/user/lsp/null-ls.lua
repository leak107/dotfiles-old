local null_status, null_ls = pcall(require, 'null-ls')

if not null_status then
  return
end

null_ls.setup ({
  sources = {
    null_ls.builtins.completion.luasnip,
    null_ls.builtins.formatting.phpcsfixer,
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.diagnostics.phpcs,
    null_ls.builtins.diagnostics.eslint,
  }
})
