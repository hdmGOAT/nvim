local cmp_nvim_lsp = require("cmp_nvim_lsp")

local capabilities = cmp_nvim_lsp.default_capabilities()

-- Setup clangd for C/C++
vim.lsp.config('clangd', {
  capabilities = capabilities,
  root_markers = {
    "compile_commands.json",
    "compile_flags.txt",
    ".clangd",
    ".git",
  },
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--header-insertion=iwyu",
    "--completion-style=detailed",
    "--function-arg-placeholders",
    "--fallback-style=llvm",
  },
  init_options = {
    usePlaceholders = true,
    completeUnimported = true,
    clangdFileStatus = true,
    fallbackFlags = {
      "-Isrc",
      "-Iinclude",
    },
  },
})
vim.lsp.enable('clangd')
