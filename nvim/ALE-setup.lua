-- ALE setup
-- Define ALE fixers for specific filetypes
vim.g.ale_fixers = {
	cpp = { "clang-format" }, -- Use clang-format for C++
	c = { "clang-format" }, -- Use clang-format for C
	javascript = { "prettier" }, -- Use Prettier for JavaScript
	typescript = { "prettier" }, -- Use Prettier for TypeScript
	html = { "prettier" }, -- Use Prettier for HTML
	css = { "prettier" }, -- Use Prettier for CSS
	json = { "prettier" }, -- Use Prettier for JSON
	markdown = { "prettier" }, -- Use Prettier for Markdown
	python = { "black" }, -- Use Black for Python
	bash = { "shfmt" }, -- Use shfmt for Bash scripts
	lua = { "stylua" }, -- Use StyLua for Lua
	yaml = { "prettier" }, -- Use Prettier for YAML
	ruby = { "rubocop" }, -- Use RuboCop for Ruby
	php = { "php-cs-fixer" }, -- Use PHP-CS-Fixer for PHP
	go = { "gofmt" }, -- Use gofmt for Go
	rust = { "rustfmt" }, -- Use rustfmt for Rust
}

-- Enable ALE's completion engine
vim.g.ale_completion_enabled = 0

-- Enable auto-import for ALE's completion
vim.g.ale_completion_autoimport = 0

-- Always display the sign column for ALE diagnostics
vim.g.ale_sign_column_always = 1

-- We don't want to lint. It is a waste of resouces
vim.g.ale_lint_on_save = 0
vim.g.ale_lint_on_text_changed = 'never'
vim.g.ale_fix_on_save = 0
