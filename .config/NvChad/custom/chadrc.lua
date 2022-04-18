local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.options = {
  relativenumber = true,
  shiftwidth = 2,
}

M.ui = {
   theme = "catppuccin",
}

M.plugins = {
   status = {

   },
   install = {
     {
       "williamboman/nvim-lsp-installer",
       config = function()
         require("custom.lspInstall")
       end,
     },
     {'ggandor/lightspeed.nvim'}
  },
}

return M
