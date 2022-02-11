local customPlugins = require "custom.plugins"

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,

M.options = {
   mapleader = ";",
   tabstop = 2,
}

M.plugins = {
   install = customPlugins,
   status = {
      dashboard = true,
      colorizer = true,
   },
   options = {
      lspconfig = {
         setup_lsp = "custom.plugins.lspconfig",
      },
      luasnip = {
         snippet_path = {
            "./snippets",
         },
      },
   },
}

M.ui = {
   theme = "uwu",
}

return M
