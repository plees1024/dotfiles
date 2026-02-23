-- Define highlight groups for the square brackets and the uppercase word
vim.cmd("highlight TagButtonHighlight ctermfg=Red ctermbg=Black guifg=#FF0000 guibg=#000000")

-- Apply highlighting to all files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*",
	callback = function()
		-- Highlight the square brackets
		vim.fn.matchadd("TagButtonHighlight", "\\[\\|\\]")

		-- Highlight any uppercase word inside square brackets
		vim.fn.matchadd("TagButtonHighlight", "\\[\\zs[A-Z0-9_]\\+\\ze\\]")
	end,
})

-- Define highlight group for tag endpoints
vim.cmd("highlight TagEndpointHighlight ctermfg=Red ctermbg=Blue guifg=#FF0000 guibg=#0000FF")

-- Apply highlighting to all files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*",
	callback = function()
		-- Highlight the angle brackets
		vim.fn.matchadd("TagEndpointHighlight", ">[A-Z0-9_]\\+<")
	end,
})
