-- lua/lsp/astro.lua
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local capabilities = cmp_nvim_lsp.default_capabilities()

vim.lsp.config("astro", {
  capabilities = capabilities,
  filetypes = { "astro" },
})

vim.lsp.enable("astro")
