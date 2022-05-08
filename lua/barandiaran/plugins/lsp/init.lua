local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("barandiaran.plugins.lsp.lsp-installer")
require("barandiaran.plugins.lsp.handlers").setup()
