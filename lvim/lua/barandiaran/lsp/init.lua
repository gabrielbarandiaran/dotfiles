require "barandiaran.lsp.languages.css"
require "barandiaran.lsp.languages.go"
require "barandiaran.lsp.languages.python"
require "barandiaran.lsp.languages.rust"
require "barandiaran.lsp.languages.sh"
require "barandiaran.lsp.languages.typescript"

lvim.lsp.diagnostics.virtual_text = false

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "stylua", filetypes = { "lua" } },
  { command = "shfmt", filetypes = { "sh", "zsh" } },
  { command = "prettierd", filetypes = { "javascript", "typescript", "html", "css" } },
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
{ command = "eslint_d", filetypes = { "typescript", "javascript" } },
  { command = "selene", filetypes = { "lua" } },
}
