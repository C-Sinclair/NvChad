local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,

M.options = {
   mapleader = ";",
   tabstop = 2,
}

M.plugins = {
   status = {
      dashboard = true,
   },
   options = {
      lspconfig = {
         setup_lsp = "custom.plugins.lspconfig",
      },
   },
}

M.ui = {
   theme = "uwu",
}

return M
