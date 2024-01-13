local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>ha", mark.add_file, { desc = "[H]arpoon [A]dd File" })
vim.keymap.set("n", "<leader>hs", ui.toggle_quick_menu, { desc = "[H]arpoon [S]how Quick Menu" })

vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end, { desc = "Harpoon open 1st" })
vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end, { desc = "Harpoon open 2nd" })
vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end, { desc = "Harpoon open 3rd" })
vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end, { desc = "Harpoon open 4th" })
