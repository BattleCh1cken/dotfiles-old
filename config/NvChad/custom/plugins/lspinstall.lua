-- custom.configs.lspconfig file

local M = {}
--Keybinds
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<leader>le', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
M.setup_lsp = function(attach, capabilities)
  local lsp_installer = require("nvim-lsp-installer")
  lsp_installer.settings({
    ui = {
      icons = {
        server_installed = "﫟",
        server_pending = "",
        server_uninstalled = "✗",
      },
    },
  })
  --Server configs

  lsp_installer.on_server_ready(function(server)
    local opts = {
      on_attach = attach,
      capabilities = capabilities,
      settings = {},
    }
    if server.name == "sumneko_lua" then
      sumneko_opts = {
        settings = {

          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.stdpath("config") .. "/lua"] = true,
              },
            },
          },
        },
      }
      opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
    end

    server:setup(opts)
    vim.cmd([[ do User LspAttachBuffers ]])
  end)
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



