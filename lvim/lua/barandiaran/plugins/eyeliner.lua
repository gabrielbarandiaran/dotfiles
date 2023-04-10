require("eyeliner").setup({
  highlight_on_key = true,
})

vim.api.nvim_set_hl(0, 'EyelinerPrimary', { fg='#ff00ff', bold = true, underline = false })
vim.api.nvim_set_hl(0, 'EyelinerSecondary', { fg='#00ffff', underline = false })
