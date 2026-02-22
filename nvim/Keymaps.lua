---===Keybindings===---
-- Navigate to previous and next tabs
vim.api.nvim_set_keymap("n", "<A-,>", ":tabprevious<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-.>", ":tabnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<A-,>", "<ESC>:tabprevious<CR>v", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<A-.>", "<ESC>:tabnext<CR>v", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-,>", "<ESC>:tabprevious<CR>i", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-.>", "<ESC>:tabnext<CR>i", { noremap = true, silent = true })

-- Move current tab to the left and right using Shift + Alt + , / .
vim.api.nvim_set_keymap("n", "<A-<>", ":tabmove -1<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A->>", ":tabmove +1<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<A-<>", "<ESC>:tabmove -1<CR>v", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<A->>", "<ESC>:tabmove +1<CR>v", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-<>", "<ESC>:tabmove -1<CR>i", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A->>", "<ESC>:tabmove +1<CR>i", { noremap = true, silent = true })

-- Open a new tab
vim.api.nvim_set_keymap("n", "<C-t>", ":tabnew<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-t>", "<ESC>:tabnew<CR>v", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-t>", "<ESC>:tabnew<CR>i", { noremap = true, silent = true })

-- Open a file in the current tab
vim.api.nvim_set_keymap("n", "<C-o>", ":edit ", { noremap = true, silent = false })
vim.api.nvim_set_keymap("v", "<C-o>", "<ESC>:edit ", { noremap = true, silent = false })
vim.api.nvim_set_keymap("i", "<C-o>", "<ESC>:edit ", { noremap = true, silent = false })

-- Ctrl+A: Select all in visual mode
vim.api.nvim_set_keymap("n", "<C-a>", "ggVG", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-a>", "<ESC>ggVG", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-a>", "<ESC>ggVG", { noremap = true, silent = true })

-- Ctrl+O: Open
vim.api.nvim_set_keymap("n", "<C-o>", ":edit ", { noremap = true, silent = false })
vim.api.nvim_set_keymap("i", "<C-o>", "<ESC>:edit ", { noremap = true, silent = false })
vim.api.nvim_set_keymap("v", "<C-o>", "<ESC>:edit ", { noremap = true, silent = false })

-- Save the current buffer with Ctrl+S
vim.api.nvim_set_keymap("n", "<C-s>", ":lua SaveBuffer()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-s>", "<ESC>:lua SaveBuffer()<CR>i", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-s>", ":lua SaveBuffer()<CR>", { noremap = true, silent = true }) -- Visual mode mapping

-- With nvim_comment, gcc in normal mode toggles commenting of a line, we will bind that to Ctrl+/:
vim.api.nvim_set_keymap("n", "<C-_>", ":CommentToggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-_>", "<ESC>:CommentToggle<CR>", { noremap = true, silent = true }) -- Visual mode mapping
vim.api.nvim_set_keymap("i", "<C-_>", "<ESC>:CommentToggle<CR>i", { noremap = true, silent = true }) -- Insert mode mapping

-- Function to save the current buffer, prompting for filename if necessary
function SaveBuffer()
	local filename = vim.fn.expand("%:p") -- Get the full file path of the current buffer
	if filename == "" or filename == nil then
		-- If no filename is set, prompt for a filename
		vim.cmd("write") -- This will prompt the user for a filename if it's a new buffer
	else
		-- If filename is set, just save the buffer
		vim.cmd("write")
	end
end

-- Bind Ctrl+Z for undo
vim.api.nvim_set_keymap("n", "<C-z>", "u", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-z>", "u", { noremap = true, silent = true }) -- Visual mode undo
vim.api.nvim_set_keymap("i", "<C-z>", "<ESC>u<CR>i", { noremap = true, silent = true })

-- Bind Ctrl+Y for redo
vim.api.nvim_set_keymap("n", "<C-y>", "<C-r>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-y>", "<C-r>", { noremap = true, silent = true }) -- Visual mode redo
vim.api.nvim_set_keymap("i", "<C-y>", "<ESC><C-r><CR>i", { noremap = true, silent = true })

-- Map Ctrl+Q to the GracefulExit function
function GracefulExit()
	-- Check if the buffer is modified (unsaved changes)
	if vim.bo.modified then
		-- Check if the buffer has a name
		if vim.api.nvim_buf_get_name(0) == "" then
			-- Prompt for a file name
			local filename = vim.fn.input("Save as: ")
			if filename == "" then
				-- Now, we just force exit vim
				vim.cmd("quit!")
			else
				vim.cmd("write " .. filename)
			end
		else
			-- Save the buffer if it has a name
			vim.cmd("write")
		end
	end

	-- Quit Neovim
	vim.cmd("quit")
end

vim.api.nvim_set_keymap("n", "<C-q>", ":lua GracefulExit()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-q>", ":lua GracefulExit()<CR>", { noremap = true, silent = true }) -- Visual mode GracefulExit
vim.api.nvim_set_keymap("i", "<C-q>", "<ESC>:lua GracefulExit()<CR>i", { noremap = true, silent = true })

-- Map PageDown and PageUp to move the cursor by 10 lines
vim.api.nvim_set_keymap("n", "<PageDown>", "10j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<PageUp>", "10k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<PageDown>", "10j", { noremap = true, silent = true }) -- Visual mode mapping for PageDown/PageUp
vim.api.nvim_set_keymap("v", "<PageUp>", "10k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<PageDown>", "<ESC>10j<CR>i", { noremap = true, silent = true }) -- Insert mode mappings for PageDown/PageUp
vim.api.nvim_set_keymap("i", "<PageUp>", "<ESC>10k<CR>i", { noremap = true, silent = true })

-- Enter insert mode using Backspace, Delete, and Enter in normal and visual modes
vim.api.nvim_set_keymap("n", "<BS>", "i<BS>", { noremap = true, silent = true }) -- Backspace to insert mode in normal mode
vim.api.nvim_set_keymap("n", "<Del>", "i<Del>", { noremap = true, silent = true }) -- Delete to insert mode in normal mode
vim.api.nvim_set_keymap("n", "<CR>", "i<CR>", { noremap = true, silent = true }) -- Enter to insert mode in normal mode
vim.api.nvim_set_keymap("v", "<BS>", "d", { noremap = true, silent = true }) -- Backspace to delete selected text in visual mode
vim.api.nvim_set_keymap("v", "<Del>", '"_d', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<CR>", "i<CR>", { noremap = true, silent = true }) -- Enter to insert mode in visual mode

-- Ctrl+X to yank (copy) and delete the current line
vim.api.nvim_set_keymap("n", "<C-x>", "dd", { noremap = true, silent = true }) -- Yank and delete the current line in normal mode
vim.api.nvim_set_keymap("v", "<C-x>", "d", { noremap = true, silent = true }) -- Yank and delete selected text in visual mode
vim.api.nvim_set_keymap("i", "<C-x>", "<Esc>dd<CR>i", { noremap = true, silent = true }) -- Yank and delete the current line in insert mode

-- Meta+Up/Down arrows to move a line up or down (work in insert mode for cursor position)
vim.api.nvim_set_keymap("n", "<M-Up>", ":m .-2<CR>==", { noremap = true, silent = true }) -- Move the current line up in normal mode
vim.api.nvim_set_keymap("n", "<M-Down>", ":m .+1<CR>==", { noremap = true, silent = true }) -- Move the current line down in normal mode
vim.api.nvim_set_keymap("v", "<M-Up>", "<ESC>:m '<-2<CR>gv=gv<CR>v", { noremap = true, silent = true }) -- Move selected lines up in visual mode
vim.api.nvim_set_keymap("v", "<M-Down>", "<ESC>:m '>+1<CR>gv=gv<CR>v", { noremap = true, silent = true }) -- Move selected lines down in visual mode
vim.api.nvim_set_keymap("i", "<M-Up>", "<ESC>:m '<-2<CR>gv=gv<CR>i", { noremap = true, silent = true }) -- Move selected lines up in visual mode
vim.api.nvim_set_keymap("i", "<M-Down>", "<ESC>:m '>+1<CR>gv=gv<CR>i", { noremap = true, silent = true }) -- Move selected lines down in visual mode

-- Ctrl+C to copy without deleting the current line or selected block in insert mode
vim.api.nvim_set_keymap("i", "<C-c>", "<Esc>yy<CR>i", { noremap = true, silent = true }) -- Copy the current line in insert mode
vim.api.nvim_set_keymap("n", "<C-c>", "yy", { noremap = true, silent = true }) -- Copy the current line in insert mode
vim.api.nvim_set_keymap("v", "<C-c>", "y", { noremap = true, silent = true }) -- Copy selected text in visual mode

-- Ctrl+X to yank and delete selected block in visual mode, and copy and delete in insert mode
vim.api.nvim_set_keymap("i", "<C-x>", "<Esc>dd", { noremap = true, silent = true }) -- Yank and delete the current line in insert mode
vim.api.nvim_set_keymap("n", "<C-x>", "dd", { noremap = true, silent = true }) -- Yank and delete the current line in normal mode
vim.api.nvim_set_keymap("v", "<C-x>", "d", { noremap = true, silent = true }) -- Yank and delete the selected block in visual mode

-- Ctrl+V to paste the yanked text
vim.api.nvim_set_keymap("n", "<C-v>", "p", { noremap = true, silent = true }) -- Paste the yanked text in normal mode
vim.api.nvim_set_keymap("v", "<C-v>", "p", { noremap = true, silent = true }) -- Paste the yanked text in visual mode
vim.api.nvim_set_keymap("i", "<C-v>", "<Esc>p<CR>i", { noremap = true, silent = true }) -- Paste the yanked text in insert mode

-- Visual mode delete without copying to the clipboard
vim.api.nvim_set_keymap("v", "<Del>", '"_d', { noremap = true, silent = true })

-- Normal mode delete line with delete
vim.api.nvim_set_keymap("n", "<Del>", "_d", { noremap = true, silent = true })

-- Ctrl+Delete: Delete the next word
vim.api.nvim_set_keymap("i", "<C-Del>", "<C-o>dw", { noremap = true, silent = true }) -- Insert mode
vim.api.nvim_set_keymap("n", "<C-Del>", "dw", { noremap = true, silent = true }) -- Normal mode
vim.api.nvim_set_keymap("v", "<C-Del>", "d", { noremap = true, silent = true }) -- Visual mode

-- Ctrl+Backspace: Delete the previous word
vim.api.nvim_set_keymap("i", "<C-h>", "<C-w>", { noremap = true, silent = true }) -- Insert mode
vim.api.nvim_set_keymap("n", "<C-h>", "db", { noremap = true, silent = true }) -- Normal mode
vim.api.nvim_set_keymap("v", "<C-h>", "d", { noremap = true, silent = true }) -- Visual mode

---===Tags===---
-- Map Ctrl+Space to jump to the tag
vim.api.nvim_set_keymap("n", "<C-Space>", ":tag<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-Space>", "<Esc>:tag<CR>", { noremap = true, silent = true })

-- Map Ctrl+Meta+Space to return
vim.api.nvim_set_keymap("n", "<C-M-Space>", ":pop<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-M-Space>", "<Esc>:pop<CR>", { noremap = true, silent = true })

---===NvimTree===---
vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

---===CodeCompanion Chat===---
vim.api.nvim_set_keymap("n", "<C-b>", ":CodeCompanionChat #buffer @editor Hello! Ready for some work?<CR>", { noremap = true, silent = true })

---===Null-ls format===---
vim.api.nvim_set_keymap("n", "<C-f>", ":lua vim.lsp.buf.format()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-f>", ":lua vim.lsp.buf.format()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-f>", ":lua vim.lsp.buf.format()<CR>", { noremap = true, silent = true })

