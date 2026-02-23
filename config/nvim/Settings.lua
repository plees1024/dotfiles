---===General Settings===---
-- Set the width of a tab to 4 spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true -- Use spaces instead of tabs for indentation

-- Make saving files with sudo less of an absolute pain in the arse
vim.api.nvim_create_user_command("W", function()
	vim.cmd("write | !sudo tee % > /dev/null")
	vim.cmd("edit!")
end, {})

-- Open files passed in the args vector in new tabs, skipping the first one
local args = vim.fn.argv()

if #args > 1 then
	-- Start from the second file in the args list
	for i = 2, #args do
		vim.cmd("tabnew " .. args[i])
	end
end

-- Clipboard settings
vim.opt.clipboard:append("unnamedplus")

-- Line numbers! What the fuck would you do without them?
vim.opt.number = true

-- Set up 'industrial' theme
vim.cmd("colorscheme industry")

-- Remove the background so the compositor can handle it
vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
vim.api.nvim_set_hl(0, "VertSplit", { bg = "NONE" })

-- Set StatusLine and StatusLineNC to black background
vim.api.nvim_set_hl(0, "StatusLine", { bg = "#000000", fg = "#00ff00" }) -- Black background, green foreground
vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#000000", fg = "#00ff00" }) -- Black background, green foreground
