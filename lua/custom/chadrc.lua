local customPlugins = require "custom.plugins"
local customConfigs = require "custom.plugins.configs"

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
      snippets = true,
   },
   options = {
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig",
      },
      luasnip = {},
   },
   default_plugin_config_replace = {
      nvim_tree = customConfigs.nvimtree,
   },
   default_plugin_remove = {
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
   },
}

M.ui = {
   theme = "uwu",
}

return M
