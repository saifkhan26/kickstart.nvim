return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    opts = {
      color_overrides = {
        mocha = {
          base = '#000000',
          mantle = '#000000',
          crust = '#000000',
        },
      },
    },
  },
  { 'ThePrimeagen/harpoon' },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {}, -- this is equalent to setup({}) function
  },
  {
    'kylechui/nvim-surround',
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup {}
    end,
  },
  { 'echasnovski/mini.files', version = '*' },
  {
    'stevearc/oil.nvim',
    opts = {},
  },
  {
    'uga-rosa/ccc.nvim',
  },
  {
    'mbbill/undotree',
  },
}
