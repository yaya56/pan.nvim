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
  },
  -- pickers = {
  --   find_files = {
  --     theme = 'dropdown'
  --   }
  -- }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')



require('lualine').setup({
	options = {
		theme='dracula',
		-- theme='gruvbox',
    disabled_filetypes = {     -- Filetypes to disable lualine for.
      statusline = {'NvimTree'},       -- only ignores the ft for statusline.
      winbar = {'NvimTree'},           -- only ignores the ft for winbar.
  }
	},
  sections = {
    lualine_c = {{'filename',path=1}}
  }
})


require('Comment').setup()

require'alpha'.setup(require'alpha.themes.startify'.config)

require('mason').setup()

