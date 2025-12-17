vim.g.mapleader = " "
vim.g.maplocalleader = " "

local function map(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, desc = desc })
end

-- Indentation
map("v", "<Tab>", ">gv", "Indent line")
map("v", "<S-Tab>", "<gv", "Unindent line")

-- NvimTree
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", "Toggle Explorer")
map("n", "<leader>w", "<cmd>NvimTreeFocus<CR>", "Focus Explorer")

-- Trouble
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", "Toggle Trouble (Diagnostics)")
map("n", "<leader>xw", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", "Trouble (Workspace Diagnostics)")
map("n", "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=1<CR>", "Trouble (Document Diagnostics)")
map("n", "<leader>xq", "<cmd>Trouble quickfix toggle<CR>", "Trouble (Quickfix)")
map("n", "<leader>xl", "<cmd>Trouble loclist toggle<CR>", "Trouble (Loclist)")

-- Window Navigation
map("n", "<C-h>", "<C-w>h", "Navigate Left")
map("n", "<C-j>", "<C-w>j", "Navigate Down")
map("n", "<C-k>", "<C-w>k", "Navigate Up")
map("n", "<C-l>", "<C-w>l", "Navigate Right")

-- Move Lines
map("v", "J", ":m '>+1<CR>gv=gv", "Move line down")
map("v", "K", ":m '<-2<CR>gv=gv", "Move line up")

-- Search
map("n", "n", "nzzzv", "Next search result (centered)")
map("n", "N", "Nzzzv", "Previous search result (centered)")
map("n", "<leader>h", "<cmd>nohlsearch<CR>", "Clear search highlights")

-- Keymaps Help
vim.api.nvim_create_user_command("Keymaps", function()
  vim.cmd("vsplit " .. vim.fn.stdpath("config") .. "/lua/config/keymaps.lua")
  vim.cmd("setlocal readonly")
  vim.cmd("setlocal nomodifiable")
end, { desc = "Open keymaps configuration as a manual" })

map("n", "<leader>?", "<cmd>Keymaps<CR>", "Show Keymaps Manual")

-- LaTeX (VimTeX)
map("n", "<leader>ll", ":VimtexCompile<CR>", "VimTeX Compile")
map("n", "<leader>lv", ":VimtexView<CR>", "VimTeX View")
map("n", "<leader>li", ":VimtexStop<CR>", "VimTeX Stop")
