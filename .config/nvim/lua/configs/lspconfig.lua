-- EXAMPLE 
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
-- servers available here
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- or use :help lspconfig-all
local servers = {
  "html",
  "cssls",
  "bashls",
  "tsserver",
  "clangd",
  "solargraph",
  "ruby_lsp",
  "pyright",
  "pylsp",
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}
