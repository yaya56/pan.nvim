
vim.g.mapleader=' '
vim.g.maplocalleader=' '



local opts = {noremap=true,silent=true}


local map = vim.api.nvim_set_keymap


-- map('n','<Ctrl-n>','<Ctrl-w>w',opts)



-- Packer
map('n','<leader>ps','<cmd>:PackerSync<Cr>',opts)
map('n','<leader>pi','<cmd>:PackerInstall<Cr>',opts)

-- NvimTree
map('n','<leader><Bs>','<cmd>:NvimTreeToggle<Cr>',opts)



-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, opts)
vim.keymap.set('n', '<leader>fg', builtin.live_grep, opts)
vim.keymap.set('n', '<leader>fb', builtin.buffers, opts)
vim.keymap.set('n', '<leader>fh', builtin.help_tags, opts)

