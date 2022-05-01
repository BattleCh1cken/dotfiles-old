return {
["jose-elias-alvarez/null-ls.nvim"] = {      after = "nvim-lspconfig",
config = function()
  require("custom.plugins.null-ls").setup()
end,
},
["williamboman/nvim-lsp-installer"] = {
  after = "nvim-lspconfig",
},
["ggandor/lightspeed.nvim"] = {},
["goolord/alpha-nvim"] = {
         disable = false,
      },
}
