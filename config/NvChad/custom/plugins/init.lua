return {
["jose-elias-alvarez/null-ls.nvim"] = {      after = "nvim-lspconfig",
config = function()
  require("custom.plugins.null-ls").setup()
end,
},
["ggandor/lightspeed.nvim"] = {},
["goolord/alpha-nvim"] = {
         disable = false,
      },
["nvim-neorg/neorg"] = {
  ft = norg,
  config = function()
        require('neorg').setup {
        }
    end,
    requires = "nvim-lua/plenary.nvim"
  
},
}
