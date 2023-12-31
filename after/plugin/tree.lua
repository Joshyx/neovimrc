local api = require("nvim-tree").setup({
  sort = {
    sorter = "name",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
    git_ignored = false,
  },
})

vim.cmd.NvimTreeOpen()
