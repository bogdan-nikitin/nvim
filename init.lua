if vim.fn.has('win16') or vim.fn.has('win32') or vim.fn.has('win64') or vim.fn.has('win95') then
    vim.cmd('set runtimepath+=~/vimfiles,~/vimfiles/after')
    vim.cmd('set packpath+=~/vimfiles')
    vim.cmd('source ~/_vimrc')
else
    vim.cmd('source ~/.vimrc')
end

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

require("lazy").setup("plugins")
require('keymaps')

-- local opt = vim.opt
-- opt.signcolumn = 'yes' -- Moved to LspAttach


