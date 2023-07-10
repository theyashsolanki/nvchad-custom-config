local typescript_setup, typescript = pcall(require, "typescript")
if not typescript_setup then
  return
end


local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "tailwindcss", "jsonls", "bashls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end


--
-- clang setup
lspconfig["clangd"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
  }
}



-- typescript setup additional
typescript.setup({
  server = {
    capabilities = capabilities,
    on_attach = on_attach,
  },
})

lspconfig["emmet_ls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
})


