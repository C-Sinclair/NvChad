return {
   { "wakatime/vim-wakatime" },
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
