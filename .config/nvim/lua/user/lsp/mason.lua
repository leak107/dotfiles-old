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
  on_attach = require("user.lsp.handlers").on_attach,
  capabilities = require("user.lsp.handlers").capabilities,
}

mason.setup()
mason_lsp.setup({
  ensure_installed = {
    'lua-language-server',
    'html-lsp',
    'css-lsp',
    'eslint-lsp',
    'tailwindcss-language-server',
    'intelephense',
    'vue-language-server',
  },
  automatic_installation = false
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
        require('user.lsp.config.sumneko'),
        defaultLSPConfig
      )
    )
  end,
  ["jsonls"] = function ()
    lspconfig.jsonls.setup(
      vim.tbl_extend(
        "force",
        require('user.lsp.config.jsonls'),
        defaultLSPConfig
      )
    )
  end,
  ["emmet_ls"] = function ()
    lspconfig.emmet_ls.setup(
      vim.tbl_extend(
        "force",
        require('user.lsp.config.emmet'),
        defaultLSPConfig
      )
    )
  end,
  ["html"] = function ()
    defaultLSPConfig.capabilities.textDocument.completion.completionItem.snippetSupport = true
    lspconfig.html.setup(
      vim.tbl_extend(
        "force",
        require('user.lsp.config.html'),
        defaultLSPConfig
      )
    )
  end,
}
