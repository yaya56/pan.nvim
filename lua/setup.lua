vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
-- require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})



require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')



require('lualine').setup({
	options = {
		theme='dracula'
	}
})


require('Comment').setup()







local home = os.getenv('HOME')
local db = require('dashboard')
db.confirm_key='Cr'
-- macos
db.preview_command = 'cat | lolcat -F 0.3'
-- linux
--   db.preview_command = 'ueberzug'
db.session_auto_save_on_exit=true
db.preview_file_path = home .. '/.config/nvim/static/neovim.cat'
db.preview_file_height = 11
db.preview_file_width = 70
db.session_directory=home .. '/.config/nvim/static/session/'
db.custom_center = {
	{icon = '  ',
	desc = 'Recently latest session                  ',
	shortcut = '<leader> r',
	action ='SessionLoad'},
	{icon = '  ',
	desc = 'Recently opened files                   ',
	action =  'DashboardFindHistory',
	shortcut = '<leader> h'},
	-- {icon = '  ',
	-- desc = 'Find  File                              ',
	-- action = 'Telescope find_files find_command=rg,--hidden,--files',
	-- shortcut = 'SPC f f'},
	-- {icon = '  ',
	-- -- desc ='File Browser                            ',
	-- action =  'Telescope file_browser',
	-- shortcut = '<leader> f b'},
	-- {icon = '  ',
	-- desc = 'Find  word                              ',
	-- action = 'Telescope live_grep',
	-- shortcut = 'SPC f w'},
	{icon = '  ',
	desc = 'Open Personal dotfiles                  ',
	action = 'Telescope dotfiles path=' .. home ..'/.config/nvim/',
	shortcut = 'SPC f d'},
}


vim.api.nvim_create_autocmd('User',{
	pattern='DBSessionLoadPre',
	callback=function ()
		pcall(vim.cmd,':NvimTreeOpen')
	end
})
