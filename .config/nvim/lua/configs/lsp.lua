
require('mason-tool-installer').setup({
  ensure_installed = {
    'basedpyright', -- python
    'ruff', -- python
    'lua_ls', -- lua
    'gopls', -- go
    'clangd', -- C
    'rust_analyzer', -- rust
    'vtsls', -- typescript/javascript
    'jsonls', -- json
    'bashls', -- bash
    'stylua', -- lua
    'prettier', -- javscript
    'shfmt', -- bash/sh
  },
})


vim.lsp.config('gopls', {
  settings = {
    gopls = {
      staticcheck = true,
      gofumpt = true,
      usePlaceholders = true,
    },
  },
})


require('mason-lspconfig').setup({
  automatic_enable = {
    exclude = { },
  },
})

-- vim.lsp.enable('vtsls')

vim.diagnostic.config({
  severity_sort = true,
  update_in_insert = false,
  float = {
    border = 'rounded',
    source = 'if_many',
  },
  underline = true,
  virtual_text = {
    spacing = 2,
    source = 'if_many',
    prefix = '●',
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = 'E',
      [vim.diagnostic.severity.WARN] = 'W',
      [vim.diagnostic.severity.INFO] = 'I',
      [vim.diagnostic.severity.HINT] = 'H',
    },
  },
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local bufnr = args.buf
    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
    end

    map('n', 'K', vim.lsp.buf.hover, 'LSP Hover')
    map('n', 'gd', vim.lsp.buf.definition, 'Go to definition')
    map('n', 'gD', vim.lsp.buf.declaration, 'Go to declaration')
    map('n', 'gi', vim.lsp.buf.implementation, 'Go to implementation')
    map('n', 'gr', vim.lsp.buf.references, 'References')
    map('n', '<leader>rn', vim.lsp.buf.rename, 'Rename symbol')
    map({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, 'Code action')
    map('n', '<leader>f', function()
      vim.lsp.buf.format({ async = true })
    end, 'Format buffer')
  end,
})
