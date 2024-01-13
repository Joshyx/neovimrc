local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    { 'rose-pine/neovim',       name = 'rose-pine' },
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = ":TSUpdate"
    },
    { 'ThePrimeagen/harpoon' },
    { 'folke/which-key.nvim' },
    { 'tpope/vim-fugitive' },
    { 'lewis6991/gitsigns.nvim' },
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            { 'williamboman/mason.nvim',   config = true },
            'williamboman/mason-lspconfig.nvim',

            { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x' },

            { 'j-hui/fidget.nvim',         opts = {} },

            'folke/neodev.nvim',

            'lukas-reineke/lsp-format.nvim',
        }
    },
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
        }
    },
    { 'windwp/nvim-autopairs',      opts = {}, event = 'InsertEnter' },
    { 'nvim-lualine/lualine.nvim' },
    { 'nvim-tree/nvim-web-devicons' },
    { 'nvim-tree/nvim-tree.lua' },
    {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup()
        end
    },
    {
        "NeogitOrg/neogit",
        dependencies = {
            "sindrets/diffview.nvim", -- optional
            "ibhagwan/fzf-lua",       -- optional
        },
        config = true
    },
    { 'tpope/vim-surround' },
    {
        'numToStr/Comment.nvim',
        config = function()
            require("Comment").setup()
        end
    },
    { 'justinmk/vim-sneak' },
    { 'romgrk/barbar.nvim' },
    { 'eandrju/cellular-automaton.nvim' },
    { 'ThePrimeagen/refactoring.nvim', },
})
