vim.api.nvim_create_autocmd('BufEnter', { -- Better highlights
	command = "syntax sync fromstart",
	pattern = { '*.ly', '*.ily', '*.tex', '*.texi', '*.texinfo' }
})

vim.api.nvim_create_autocmd('QuickFixCmdPost', {  -- Show quickfix if errors, else close window
	command = "cwindow",
	pattern = "*"
})
