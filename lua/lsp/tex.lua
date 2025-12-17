local cmp_nvim_lsp = require("cmp_nvim_lsp")
local capabilities = cmp_nvim_lsp.default_capabilities()

vim.lsp.config('texlab', {
  capabilities = capabilities,
  settings = {
    texlab = {
      build = {
        onSave = false,        -- Disable TexLab build (let VimTeX handle it)
        forwardSearchAfter = false,
      },
      chktex = {
        onOpenAndSave = true,
        onEdit = true,
      },
      forwardSearch = {
        executable = "zathura",
        args = { "--synctex-forward", "%l:1:%f", "%p" },
      },
    },
  },
})
vim.lsp.enable('texlab')
