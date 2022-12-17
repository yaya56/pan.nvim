local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end



--  auto packer
vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerInstall
augroup end
]])


local packer_bootstrap = ensure_packer()

return require('packer').startup({function(use)

  use 'wbthomason/packer.nvim'

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  -- Post-install/update hook with neovim command
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  use { "williamboman/mason.nvim" }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'},{'nvim-telescope/telescope-fzf-native.nvim', run = 'make' } }
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  -- Use dependency and run lua function after load
  use {
    'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }

use 'neovim/nvim-lspconfig'
  -- use {'neoclide/coc.nvim', branch = 'release'}
  use {'mfussenegger/nvim-dap'}
  -- You can alias plugin names
  use {'dracula/vim', as = 'dracula'}




  use {'glepnir/dashboard-nvim'}


  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  use {
    'goolord/alpha-nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
      require'alpha'.setup(require'alpha.themes.startify'.config)
    end
  }
  use({
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup {}
    end,
  })
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  -- -- Packer
  -- use({
  --   "folke/noice.nvim",
  --   config = function()
  --     require("noice").setup({
  --       -- add any options here
  --     })
  --   end,
  --   requires = {
  --     -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
  --     "MunifTanjim/nui.nvim",
  --     -- OPTIONAL:
  --     --   `nvim-notify` is only needed, if you want to use the notification view.
  --     --   If not available, we use `mini` as the fallback
  --     "rcarriga/nvim-notify",
  --   }
  -- })
  --

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end,
config= {


  display = {
    open_fn = function()
      return require('packer.util').float({border='single'})
    end,
    profile = {
      enable = true,
      threshold = 1
    }
  }
}}
)


