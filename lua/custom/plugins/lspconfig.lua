local M = {}

M.setup_lsp = function(attach, capabilities)
   local lspconfig = require "lspconfig"

   local on_attach = function(client, bufnr)
      client.resolved_capabilities.document_formatting = false
      vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", [[ :lua vim.lsp.buf.definition()<CR>]], {})
      vim.api.nvim_buf_set_keymap(bufnr, "n", "K", [[ :lua vim.lsp.buf.hover()<CR>]], {})
      vim.api.nvim_buf_set_keymap(bufnr, "n", "gR", [[ :lua vim.lsp.buf.rename()<CR>]], {})
   end
   -- lspservers with default config

   local servers = { "html", "cssls", "pyright" }

   for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
         on_attach = on_attach,
         capabilities = capabilities,
         flags = {
            debounce_text_changes = 150,
         },
      }
   end

   -- typescript
   lspconfig.tsserver.setup {
      capabilities = capabilities,
      on_attach = on_attach,
   }
   -- the above tsserver lspconfig will remvoe the tsserver's inbuilt formatting,since I use null-ls with denofmt for formatting ts/js.

   local sumneko_root_path = "/home/conor/Repos/sumneko/lua-language-server"
   local sumneko_binary = sumneko_root_path .. "/bin/Linux/lua-language-server"

   lspconfig.sumneko_lua.setup {
      cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
         Lua = {
            diagnostics = {
               globals = { "vim" },
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

return M
