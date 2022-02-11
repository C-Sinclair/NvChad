local map = require("core.utils").map

local M = {}

M.setup_lsp = function(attach, capabilities)
   local lspconfig = require "lspconfig"

   -- lspservers with default config

   local servers = { "html", "cssls", "pyright" }

   for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
         on_attach = attach,
         capabilities = capabilities,
         flags = {
            debounce_text_changes = 150,
         },
      }
   end

   -- typescript

   lspconfig.tsserver.setup {
      capabilities = capabilities,
      on_attach = function(client, bufnr)
         client.resolved_capabilities.document_formatting = false
         map("n", "gd", [[ :lua vim.lsp.buf.definition()<CR>]])
         map("n", "K", [[ :lua vim.lsp.buf.hover()<CR>]])
         map("n", "gR", [[ :lua vim.lsp.buf.rename()<CR>]])
      end,
   }

   -- the above tsserver lspconfig will remvoe the tsserver's inbuilt formatting,since I use null-ls with denofmt for formatting ts/js.
end

return M
