local lspconfig = require("lspconfig")

lspconfig.svelte.setup({
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    -- Optional: auto-refresh when Svelte config changes
    if client.name == "svelte" then
      vim.api.nvim_create_autocmd("BufWritePost", {
        pattern = { "svelte.config.js", "svelte.config.cjs", "svelte.config.ts" },
        callback = function()
          client.notify("workspace/didChangeConfiguration", { settings = {} })
        end,
      })
    end
  end,
})
