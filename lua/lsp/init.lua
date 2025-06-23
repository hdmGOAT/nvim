-- Central LSP entry point
require("lsp.go")  -- You can add more like `require("lsp.lua")` etc.
require("lsp.rust")

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
})
