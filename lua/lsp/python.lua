vim.lsp.config('pyright', {
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
vim.lsp.enable('pyright')
