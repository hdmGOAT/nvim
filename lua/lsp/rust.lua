local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

-- Add enhanced capabilities for completion
local capabilities = cmp_nvim_lsp.default_capabilities()

lspconfig.rust_analyzer.setup({
  capabilities = capabilities,
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
      checkOnSave = {
        command = "clippy", -- Ensures Clippy runs on save
      },
      inlayHints = {
        enable = true,
      },
    },
  },
})
