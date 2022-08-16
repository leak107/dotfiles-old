local schemas = {
  {
    description = 'Composer configuration file',
    fileMatch = { 'composer.json' },
    url = 'https://raw.githubusercontent.com/composer/composer/main/res/composer-schema.json',
  },
  {
    description = 'NPM package configuration file',
    fileMatch = { 'package.json' },
    url = 'https://json.schemastore.org/package.json',
  }
}

return {
  settings = {
    json = {
      schemas = schemas
    }
  },
  setup = {
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line "$", 0 })
        end,
      }
    }
  }
}
