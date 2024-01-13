vim.g.mapleader = " "

-- Move lines up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- Change windows
vim.keymap.set("n", "<A-k>", "<C-w>k", { desc = "Move window up" })
vim.keymap.set("n", "<A-j>", "<C-w>j", { desc = "Move window down" })
vim.keymap.set("n", "<A-h>", "<C-w>h", { desc = "Move window left" })
vim.keymap.set("n", "<A-l>", "<C-w>l", { desc = "Move window right" })

-- Visual
vim.keymap.set("v", "A", "VggoG", { desc = "Select everything" })

-- System Clipboard
vim.keymap.set("v", "<C-C>", '"+y', { desc = "Copy to System Clipboard" })

-- File Shortcuts
vim.keymap.set("n", "<leader>fx", ':silent !chmod +x %<CR>', { desc = "Make [F]ile e[x]ecutable" })
vim.keymap.set("n", "<leader>fl", ':e!<CR>', { desc = "[L]oad [F]ile from disk" })
vim.keymap.set("n", "<leader>fs", ':s<CR>', { desc = "[S]ave [F]ile" })
