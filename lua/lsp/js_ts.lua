-- lua/lsp/js_ts.lua
local cmp_nvim_lsp = require("cmp_nvim_lsp")

-- Optional: Add capabilities for better completion support
local capabilities = cmp_nvim_lsp.default_capabilities()

vim.lsp.config('ts_ls', {
  capabilities = capabilities,
  filetypes = {
    "javascript",
    "javascriptreact", -- React JSX
    "typescript",
    "typescriptreact", -- React TSX
    "json"
  },
  settings = {
    typescript = {
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
    javascript = {
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
  },
})
vim.lsp.enable('ts_ls')
