require('nvim-treesitter.install').prefer_git = true

-- Custom settings
vim.cmd.colorscheme 'lush_theme'
vim.g.netrw_banner = 0
vim.g.netrw_altv = 1
vim.g.netrw_liststyle = 3

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- Map Ctrl-j and Ctrl-k to cnext and cprev
vim.keymap.set('n', '<C-j>', '<CMD>cnext<CR>', { silent = true })
vim.keymap.set('n', '<C-k>', '<CMD>cprev<CR>', { silent = true })

-- -- Harpoon Configure
local harpoon = require 'harpoon'

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set('n', '<A-a>', function()
  harpoon:list():add()
end)
vim.keymap.set('n', '<A-;>', function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set('n', '<A-u>', function()
  harpoon:list():select(1)
end)
vim.keymap.set('n', '<A-i>', function()
  harpoon:list():select(2)
end)
vim.keymap.set('n', '<A-o>', function()
  harpoon:list():select(3)
end)
vim.keymap.set('n', '<A-p>', function()
  harpoon:list():select(4)
end)
vim.keymap.set('n', '<A-q>', function()
  harpoon:list():select(5)
end)
vim.keymap.set('n', '<A-w>', function()
  harpoon:list():select(6)
end)
vim.keymap.set('n', '<A-e>', function()
  harpoon:list():select(7)
end)
vim.keymap.set('n', '<A-r>', function()
  harpoon:list():select(8)
end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set('n', '<A-.>', function()
  harpoon:list():prev()
end)
vim.keymap.set('n', '<A-,>', function()
  harpoon:list():next()
end)

-- mini files Configuration
require('mini.files').setup()

-- netrw mapping
vim.keymap.set('n', '<leader>e', function()
  vim.cmd ':lua MiniFiles.open()'
end, { desc = 'Open [E]xplorer' })

require('oil').setup()
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

-- Undo Tree
vim.keymap.set('n', '<leader><F5>', vim.cmd.UndotreeToggle)

-- CCC config
local ccc = require 'ccc'

ccc.setup {
  -- Your preferred settings
  -- Example: enable highlighter
  highlighter = {
    auto_enable = true,
    lsp = true,
  },
}

-- require('toggleterm').setup {
--   open_mapping = [[<c-\>]],
--   direction = 'float',
--   close_on_exit = true, -- close the terminal window when the process exits
--   -- Change the default shell. Can be a string or a function returning a string
--   shell = vim.o.shell,
--   auto_scroll = true, -- automatically scroll to the bottom on terminal output
--   -- This field is only relevant if direction is set to 'float'
-- }

--    },
--  },

--
--
--<<<<<<< HEAD
--
--local lspconfig = require('lspconfig')
--local configs = require('lspconfig/configs')
--capabilities.textDocument.completion.completionItem.snippetSupport = true
--
--lspconfig.emmet_ls.setup({
--  -- on_attach = on_attach,
--  capabilities = capabilities,
--  filetypes = { "css", "html", "javascript", "javascriptreact", "less", "sass", "scss", "typescriptreact" },
--  init_options = {
--    html = {
--      options = {
--        -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
--        ["bem.enabled"] = true,
--      },
--    },
--  }
--})
--
--
---- nvim-cmp supports additional completion capabilities, so broadcast that to servers
--capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
--
---- Ensure the servers above are installed
--local mason_lspconfig = require 'mason-lspconfig'
--
--mason_lspconfig.setup {
--  ensure_installed = vim.tbl_keys(servers),
--}
--
--mason_lspconfig.setup_handlers {
--  function(server_name)
--    require('lspconfig')[server_name].setup {
--      capabilities = capabilities,
--      on_attach = on_attach,
--      settings = servers[server_name],
--      filetypes = (servers[server_name] or {}).filetypes,
--    }
--  end
--}
