-- EZTags tag system. By Patrick "Eddie" Edward Lees. This is devoted to the public domain, you may redistribute this software, or any part of it, with or without attribution. I give you explicit permission to plagurise this, and I encourage you to do so!

-- Variable to store the last tag button position
last_tag_button_pos = nil

-- Highlighting for tag buttons and tag endpoints
dofile("/Eddie/.config/nvim/EZTags-highlight.lua")

-- Function to jump to the tag
function jump_to_tag()
	-- Get the current word under the cursor
	local word = vim.fn.expand("<cword>")

	-- Check if the word is inside or on square brackets
	local cursor_pos = vim.fn.col(".") -- Get current column position
	local line = vim.fn.getline(".") -- Get current line

	-- Find positions of the square brackets
	local left_bracket_pos = string.find(line, "%[")
	local right_bracket_pos = string.find(line, "%]")

	-- Proceed only if the cursor is on or inside square brackets
	if
		left_bracket_pos
		and right_bracket_pos
		and cursor_pos >= left_bracket_pos
		and cursor_pos <= right_bracket_pos
	then
		-- Create the pattern for the tag to search for: '>tag<'
		local tag_pattern = ">" .. word .. "<"

		-- Search for the first occurrence of the tag in the file
		local search_result = vim.fn.search(tag_pattern, "W")

		-- If tag is found, jump to it
		if search_result > 0 then
			-- Store the current cursor position
			last_tag_endpoint_pos = vim.fn.getpos(".")

			-- Check if there are multiple occurrences of the tag
			local next_search_result = vim.fn.search(tag_pattern, "W")
			if next_search_result > 0 and next_search_result ~= search_result then
				-- Warn the user if multiple occurrences were found
				print("Warning: Multiple occurrences of tag '" .. word .. "' found.")
			end

			-- Move the cursor to the first found tag
			vim.cmd("normal! " .. search_result .. "G")
		else
			print("Tag not found: " .. tag_pattern)
		end
	else
		print("You must be on or inside square brackets to use the tag jump.")
	end
end

-- Function to return to the last tag button used
function return_to_last_tag_endpoint()
	if last_tag_endpoint_pos then
		vim.fn.setpos(".", last_tag_endpoint_pos)
	else
		print("No previous tag button position found.")
	end
end

-- Function to return to the last tag endpoint used
function return_to_last_tag_button()
	if last_tag_button_pos then
		vim.fn.setpos(".", last_tag_button_pos)
	else
		print("No previous tag button found.")
	end
end

-- Define a command that returns to the last tag button
vim.api.nvim_create_user_command("TagsReturn", return_to_last_tag_button, {})

-- Define a command that returns to the last tag endpoint
vim.api.nvim_create_user_command("TagsReturnToEndpoint", return_to_last_tag_endpoint, {})

-- Define a command that calls the jump to tag function
vim.api.nvim_create_user_command("TagsJump", jump_to_tag, {})
