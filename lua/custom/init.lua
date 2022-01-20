local map = require("core.utils").map

map("n", "<C-p>", [[ :Telescope git_files<CR>" ]])
map("n", "<C-f>", [[ :Telescope live_grep<CR>]])
map('n', '<C-b>', [[ :Telescope buffers<CR> ]])

-- Install plugins
local customPlugins = require "core.customPlugins"

customPlugins.add(function(use)
  use('wakatime/vim-wakatime')

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/popup.nvim' },
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzy-native.nvim' },
    },
  }

  use {
    "jose-elias-alvarez/null-ls.nvim",
    after = "nvim-lspconfig",
    config = function()
      require("custom.plugins.null-ls").setup()  
    end,
  }
 end)
