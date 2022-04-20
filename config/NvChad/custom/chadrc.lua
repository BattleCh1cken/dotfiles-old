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
  options = {
    lspconfig = {
      -- setup_lspconf = "custom.config.lspconfig"
    },
  },
  status = {
    colorizer = true,
  },
  install = {
    {
      "williamboman/nvim-lsp-installer",
      config = function()
        require("custom.config.lspInstall")
      end,
    },
    { "ggandor/lightspeed.nvim" },
    {
      "jose-elias-alvarez/null-ls.nvim",
      after = "nvim-lspconfig",
      config = function()
        require("custom.config.null-ls").setup()
      end,
    },
    {
      "Pocco81/TrueZen.nvim",
      cmd = {
        "TZAtaraxis",
        "TZMinimalist",
        "TZFocus",
      },
      config = function()
        -- check https://github.com/Pocco81/TrueZen.nvim#setup-configuration (init.lua version)
      end,
    },
  },
}

return M
