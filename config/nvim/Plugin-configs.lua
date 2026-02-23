--===Plugin Configurations===---

-- Persistent nvim-tree across tabs
require("nvim-tree").setup({
	view = {
		width = 30, -- Adjust the width as needed
		side = "left", -- Where the file tree will appear
		preserve_window_proportions = true,
	},
	actions = {
		open_file = {
			quit_on_open = false, -- Keep nvim-tree open even after opening files
		},
	},
	git = {
		enable = true, -- Enable Git status in the tree
	},
	renderer = {
		highlight_opened_files = "name", -- Highlight opened files in the tree
	},
})

vim.g.instant_username = "Eddie"

require("scrollbar").setup()

-- null-ls setup

local null_ls = require("null-ls")

local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
local event = "BufWritePre" -- or "BufWritePost" if this fucks shit up
local async = event == "BufWritePost"

null_ls.setup({
  sources = {
    -- Formatters
    null_ls.builtins.formatting.clang_format,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
})

-- Disable virtual_text since it's redundant due to lsp_lines.
vim.diagnostic.config({
	virtual_text = false,
})

require("nvim_comment").setup()

require("nvim-navic").setup({
	lsp = {
		auto_attach = true,
	},
})

require("breadcrumbs").setup()
require("mini.indentscope").setup()


-- Use Prettier for XML formatting
vim.api.nvim_create_autocmd("FileType", {
    pattern = "xml",
    command = "setlocal formatprg=prettier\\ --stdin-filepath\\ %\\ --plugin\\ @prettier/plugin-xml"
})
