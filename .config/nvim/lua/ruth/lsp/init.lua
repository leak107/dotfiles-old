local lsp_status_ok, lsp = pcall(require, "lspconfig")

if not lsp_status_ok then
  return
end

require("ruth.lsp.mason")
require("ruth.lsp.handlers").setup()
-- require("user.lsp.null-ls")
