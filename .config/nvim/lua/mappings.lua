require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- defaults
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- timestamp
map("n", "<F6>", "i<C-R>=system(\'date --iso-8601=seconds\')<CR><Esc>")

-- for dealing with copilot and gen.nvim
map("v", "<C-g>", ":Gen<CR>")
map("i", "<C-o>", "<ESC>o")

-- vim-tmux-navigator
map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>")
map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>")
map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>")
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>")
