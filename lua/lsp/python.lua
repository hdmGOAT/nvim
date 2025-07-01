local lspconfig = require("lspconfig")

lspconfig.pyright.setup({
  -- optional settings
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic", -- or "strict"
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
      },
    },
  },
})
