local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	print("Lsp Installer not found") return
end

local present, lspconfig = pcall(require, "lspconfig")

if not present then
   return
end



local M = {}
--Keybinds
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<leader>ll', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
M.setup_lsp = function(attach, capabilities)
  local lspconfig = require "lspconfig"

   -- lspservers with default config
   local servers = { "clangd", "sumneko_lua", "bashls" }
   lsp_installer.setup {
	ensure_installed = servers
}

   for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
         on_attach = attach,
         capabilities = capabilities,
      }
   end
   lspconfig.sumneko_lua.setup {
   on_attach = M.on_attach,
   capabilities = capabilities,

   settings = {
      Lua = {
         diagnostics = {
            globals = { "vim" , "awesome" },
         },
         workspace = {
            library = {
               [vim.fn.expand "$VIMRUNTIME/lua"] = true,
               [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
            },
            maxPreload = 100000,
            preloadFileSize = 10000,
         },
      },
   },
}


end




vim.diagnostic.config({
    virtual_text = false,
        float = {
        show_header = true,
        source = 'always',
        focusable = false,
      },
  })
return M



