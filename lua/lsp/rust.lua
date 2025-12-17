local cmp_nvim_lsp = require("cmp_nvim_lsp")

local capabilities = cmp_nvim_lsp.default_capabilities()

vim.lsp.config('rust_analyzer', {
  capabilities = capabilities,
  settings = {
    ["rust-analyzer"] = {
      linkedProjects = { "Cargo.toml"},
      cargo = {
        allFeatures = true,
      },
      check = {
        command = "clippy", -- Run Clippy instead of "check"
      },
      checkOnSave = true, -- Simply enable check-on-save
      inlayHints = {
        enable = true,
      },
    },
  },
})
vim.lsp.enable('rust_analyzer')
