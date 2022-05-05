-- custom.configs.lspconfig file

local M = {}
--Keybinds
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<leader>ll', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
M.setup_lsp = function(attach, capabilities)
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



