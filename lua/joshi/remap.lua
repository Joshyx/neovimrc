vim.g.mapleader = " "

-- Move lines up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Change windows
vim.keymap.set("n", "<A-k>", "<C-w>k")
vim.keymap.set("n", "<A-j>", "<C-w>j")
vim.keymap.set("n", "<A-h>", "<C-w>h")
vim.keymap.set("n", "<A-l>", "<C-w>l")

-- Visual
vim.keymap.set("v", "a", "<esc>ggVG")

-- System Clipboard
vim.keymap.set("v", "<C-C>", '"+y')
