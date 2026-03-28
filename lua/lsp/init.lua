-- Central LSP entry point
require("lsp.go")  -- You can add more like `require("lsp.lua")` etc.
require("lsp.rust")
require("lsp.python")
require("lsp.js_ts")
require("lsp.svelte")
require("lsp.astro")
require("lsp.tex")
require("lsp.cpp")


vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
})
