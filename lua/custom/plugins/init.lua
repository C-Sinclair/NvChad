return {
   { "wakatime/vim-wakatime" },
   {
      "nvim-telescope/telescope.nvim",
      requires = {
         { "nvim-lua/popup.nvim" },
         { "nvim-lua/plenary.nvim" },
         { "nvim-telescope/telescope-fzy-native.nvim" },
      },
   },
   {
      "jose-elias-alvarez/null-ls.nvim",
      after = "nvim-lspconfig",
      config = function()
         require("custom.plugins.null-ls").setup()
      end,
   },
   { "ThePrimeagen/git-worktree.nvim" },
   {
      "ThePrimeagen/harpoon",
      requires = {
         { "nvim-lua/plenary.nvim" },
      },
   },
}
