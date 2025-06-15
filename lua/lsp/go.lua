-- lua/lsp/go.lua
local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

-- Optional: Add capabilities for better completion support
local capabilities = cmp_nvim_lsp.default_capabilities()

lspconfig.gopls.setup({
  capabilities = capabilities,
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      staticcheck = true,
    },
  },
})
