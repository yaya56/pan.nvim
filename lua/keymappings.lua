
vim.cmd([[
	augroup keymap_user_config
		autocmd!
		autocmd BufWritePost keymappings.lua source <afile> 
	augroup end
]])
vim.g.mapleader=' '
vim.g.maplocalleader=' '


local opts = {noremap=true,silent=true}


local map = vim.api.nvim_set_keymap


-- map('n','<Ctrl-n>','<Ctrl-w>w',opts)



-- Packer
map('n','<leader>ps','<cmd>:PackerSync<Cr>',opts)
map('n','<leader>pi','<cmd>:PackerInstall<Cr>',opts)
-- map('n','<leader><leader>q','<cmd>:q<Cr>',opts)
-- map('n','<leader><leader>qq','<cmd>:qa<Cr>',opts)


if vim.g.vscode then

  -- vscode
  -- map('n','<leader>e','call VscodeNotify(viewContainer.workbench.view.explorer.enabled,true)',opts)
  --
  -- map('n','<C-j>','<C-w>j',opts)
  -- map('n','<C-k>','<C-w>k',opts)
  -- map('n','<C-l>','<C-w>l',opts)
  -- map('n','<C-h>','<C-w>h',opts)
  -- map('n','<C-c>','<C-w>c',opts)
  -- map('n','<C-o>','<C-w>o',opts)
else

  -- NvimTree
  map('n','<leader>e','<cmd>:NvimTreeToggle<Cr>',opts)

  map('n','<C-j>','<C-w>j',opts)
  map('n','<C-k>','<C-w>k',opts)
  map('n','<C-l>','<C-w>l',opts)
  map('n','<C-h>','<C-w>h',opts)
  map('n','<C-c>','<C-w>c',opts)
end


-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, opts)
vim.keymap.set('n', '<leader>fg', builtin.live_grep, opts)
vim.keymap.set('n', '<leader>fb', builtin.buffers, opts)
vim.keymap.set('n', '<leader>fh', builtin.help_tags, opts)

