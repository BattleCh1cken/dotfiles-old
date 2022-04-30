-- Just an example, supposed to be placed in /lua/custom/
local userPlugins = require "custom.plugins"

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.plugins = {
  options = {
    lspconfig = {
      setup_lspconf = "custom.plugins.lspinstall"
      
    },

  },
  user = userPlugins,
}

M.ui = {
   theme = "catppuccin",
}
M.options = {
  user = function()
    vim.opt.relativenumber = true
  end,
}
M.treesitter = {
  ensure_installed = {
    "lua",
    "cpp",
    "bash",

  }
}

return M

