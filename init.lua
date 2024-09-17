-- TODO: Change space to leader, map leader to space


vim.g.is_windows = vim.fn.has("win64") == 1 or vim.fn.has("win32") == 1 or vim.fn.has("win16") == 1


if vim.g.is_windows then
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

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- local opt = vim.opt
-- opt.signcolumn = 'yes' -- Moved to LspAttach


