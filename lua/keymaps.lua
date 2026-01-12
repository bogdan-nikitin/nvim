local keymap = vim.keymap

keymap.set("n", "<space>o", "o<ESC>k")
keymap.set("n", "<space>O", "O<ESC>j")
keymap.set("t", "<Esc>", "<C-\\><C-n>")
-- keymap.set("t", "<C-space>", "<C-\\><C-n>")  -- change language on MacOS

keymap.set("t", "<A-h>", "<C-\\><C-N><C-w>h")
keymap.set("t", "<A-j>", "<C-\\><C-N><C-w>j")
keymap.set("t", "<A-k>", "<C-\\><C-N><C-w>k")
keymap.set("t", "<A-l>", "<C-\\><C-N><C-w>l")

keymap.set("i", "<A-h>", "<C-\\><C-N><C-w>h")
keymap.set("i", "<A-j>", "<C-\\><C-N><C-w>j")
keymap.set("i", "<A-k>", "<C-\\><C-N><C-w>k")
keymap.set("i", "<A-l>", "<C-\\><C-N><C-w>l")

keymap.set("n", "<A-h>", "<C-w>h")
keymap.set("n", "<A-j>", "<C-w>j")
keymap.set("n", "<A-k>", "<C-w>k")
keymap.set("n", "<A-l>", "<C-w>l")

-- keymap.set("n", "<space>x", ":Lexplore<CR>")
keymap.set("n", "<space>x", require'nvim-tree.api'.tree.toggle)
local hop = require('hop')
keymap.set('n', '<leader><leader>', hop.hint_words)
