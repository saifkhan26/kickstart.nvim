require('nvim-treesitter.install').prefer_git = true

-- Custom settings
vim.cmd.colorscheme 'catppuccin'
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

-- Harpoon Configure
local mark = require 'harpoon.mark'
local ui = require 'harpoon.ui'

vim.keymap.set('n', '<A-a>', mark.add_file)
vim.keymap.set('n', '<A-;>', ui.toggle_quick_menu)

vim.keymap.set('n', '<A-u>', function()
  ui.nav_file(1)
end)
vim.keymap.set('n', '<A-i>', function()
  ui.nav_file(2)
end)
vim.keymap.set('n', '<A-o>', function()
  ui.nav_file(3)
end)
vim.keymap.set('n', '<A-p>', function()
  ui.nav_file(4)
end)
vim.keymap.set('n', '<A-q>', function()
  ui.nav_file(5)
end)
vim.keymap.set('n', '<A-w>', function()
  ui.nav_file(6)
end)
vim.keymap.set('n', '<A-e>', function()
  ui.nav_file(7)
end)
vim.keymap.set('n', '<A-r>', function()
  ui.nav_file(8)
end)
vim.keymap.set('n', '<A-.>', function()
  ui.nav_next()
end)
vim.keymap.set('n', '<A-,>', function()
  ui.nav_prev()
end)

-- mini files Configuration
require('mini.files').setup()

-- netrw mapping
vim.keymap.set('n', '<leader>e', function()
  vim.cmd ':lua MiniFiles.open()'
end, { desc = 'Open [E]xplorer' })

require('oil').setup()
vim.keymap.set('n', '-', '<CMD>Oil --float<CR>', { desc = 'Open parent directory' })

-- Undo Tree
vim.keymap.set('n', '<leader><F5>', vim.cmd.UndotreeToggle)

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
