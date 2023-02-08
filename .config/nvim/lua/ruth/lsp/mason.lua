local mason_status_ok, mason = pcall(require, "mason")
local mason_lsp_config_status_ok, mason_lsp = pcall(require, 'mason-lspconfig')

if not mason_status_ok then
  return
end

if not mason_lsp_config_status_ok then
  return
end

local lspconfig = require('lspconfig')

local defaultLSPConfig = {
  flags = {
    debounce_text_changes = 150,
  },
  on_attach = require("ruth.lsp.handlers").on_attach,
  capabilities = require("ruth.lsp.handlers").capabilities,
}

mason.setup()
mason_lsp.setup({
  ensure_installed = {
    'sumneko_lua',
    'html',
    'cssls',
    'tailwindcss',
    'eslint',
    'intelephense',
    'volar',
  },
  automatic_installation = true
})

mason_lsp.setup_handlers {
  function (server_name)
    require("lspconfig")[server_name].setup(vim.tbl_extend(
      "force",
      {},
      defaultLSPConfig
    ))
  end,
  ["sumneko_lua"] = function ()
    lspconfig.sumneko_lua.setup(
      vim.tbl_extend(
        "force",
        require('ruth.lsp.config.sumneko'),
        defaultLSPConfig
      )
    )
  end,
  ["jsonls"] = function ()
    lspconfig.jsonls.setup(
      vim.tbl_extend(
        "force",
        require('ruth.lsp.config.jsonls'),
        defaultLSPConfig
      )
    )
  end,
  ["emmet_ls"] = function ()
    lspconfig.emmet_ls.setup(
      vim.tbl_extend(
        "force",
        require('ruth.lsp.config.emmet'),
        defaultLSPConfig
      )
    )
  end,
  ["html"] = function ()
    defaultLSPConfig.capabilities.textDocument.completion.completionItem.snippetSupport = true
    lspconfig.html.setup(
      vim.tbl_extend(
        "force",
        require('ruth.lsp.config.html'),
        defaultLSPConfig
      )
    )
  end,
}
