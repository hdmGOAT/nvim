local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Theme
  { "folke/tokyonight.nvim", lazy = false, priority = 1000 },
  {
  	"rafamadriz/friendly-snippets",
  	lazy = true,
  },


  -- File tree
  {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("nvim-tree").setup()
  end,
  },

{
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      options = {
        theme = 'auto',
        section_separators = '',
        component_separators = '',
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
      },
    }
  end
},
  -- Treesitter
{
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua",
        "go",
        "rust",
        "python",
        "javascript",
        "typescript",
        "tsx",     -- React (.tsx)
        "svelte",  -- Svelte
        "astro",   -- Astro
        "json",
        "html",
        "css",
        "c",       -- C highlights
        "cpp",     -- C++ highlights
      },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
},

 
-- Mason & Go LSP
{
  "williamboman/mason.nvim",
  build = ":MasonUpdate",
  config = function()
    require("mason").setup()
  end,
},
{
  "williamboman/mason-lspconfig.nvim",
  dependencies = { "williamboman/mason.nvim" },
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "gopls",          -- Go
        "rust_analyzer",  -- Rust
        "pyright",        -- Python
        "ts_ls",          -- TypeScript / JavaScript (includes React)
        "svelte",         -- Svelte
        "astro",          -- Astro
        "texlab",         -- LaTeX
        "clangd",         -- C/C++
      },
      automatic_installation = true, -- optional: auto-install missing servers
    })
  end,
},
{
  "neovim/nvim-lspconfig",
  config = function()
    require("lsp")  -- This will load your per-language LSP configs
  end,
},
{
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
  },
  config = function()
    local cmp = require("cmp")
    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
      }),
      sources = {
        { name = "nvim_lsp" },
	{ name = "luasnip" },
      },
    })
  require("luasnip.loaders.from_vscode").lazy_load()
  end,
},
{
  "folke/trouble.nvim",
  cmd = { "Trouble" }, -- load on command
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("trouble").setup({})
  end,
},
-- LaTeX support
{
  "lervag/vimtex",
  ft = "tex",  -- only load for .tex files
  init = function()
    vim.g.vimtex_mappings_enabled = 0        -- Disable default mappings
    vim.g.vimtex_view_method = 'zathura'      -- PDF viewer
    vim.g.vimtex_compiler_method = 'latexmk' -- automatic compilation
    vim.g.vimtex_quickfix_mode = 0           -- disable automatic jump to errors
    vim.g.vimtex_compiler_latexmk = {
      build_dir = 'build',
      options = {
        '-shell-escape',
        '-verbose',
        '-file-line-error',
        '-synctex=1',
        '-interaction=nonstopmode',
      },
    }
  end,
}
})
