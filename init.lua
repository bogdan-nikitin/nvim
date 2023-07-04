require('plugins')
require('ts')
require('lsp')
require('nvim_cmp')
require('dap_config')
require('run')
require('monokai').setup {}
-- require("autoclose").setup()

-- local opt = vim.opt
local keymap = vim.keymap

-- opt.signcolumn = 'yes' -- Moved to LspAttach

keymap.set("n", "<space>o", "o<ESC>k")
keymap.set("n", "<space>O", "O<ESC>j")


--vim.api.nvim_create_user_command('LspStop', 'lua vim.lsp.stop_client(vim.lsp.get_active_clients())', {})

vim.cmd('source ~/.vimrc')

