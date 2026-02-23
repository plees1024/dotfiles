---===Plugin Configuration===---
-- Configure plugins using packer
require("packer").startup(function(use)
    require("packer").startup(function()
		use("nvim-tree/nvim-tree.lua")
	end)

	-- Plugin manager itself
	use("wbthomason/packer.nvim")
	use("ycm-core/YouCompleteMe")

    use {
  'jakewvincent/mkdnflow.nvim',
  config = function()
    require('mkdnflow').setup({
      modules = { cmp = false }  -- We are not using cmp
    })
  end
}

    use {
        'MeanderingProgrammer/render-markdown.nvim',
        config = function()
        require('render-markdown').setup({
            enabled = true,  -- Start enabled by default
            file_types = {"markdown"},
        })
        end,
    }

    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

    --==Plugins==--
    -- Stuff
    use("chrisbra/csv.vim")          -- CSV support
    use("dhruvasagar/vim-table-mode") -- Table formatting

	-- AI
	use("Exafunction/codeium.vim") -- Free supercomplete
    use {
      'olimorris/codecompanion.nvim',
      tag = 'v17.33.0',  -- Pin to this specific version
      config = function()
        require('codecompanion').setup({
        })
      end,
    }
	-- Stuff to make me not look like a crackhead
	use("neovim/nvim-lspconfig")
	use("nvimtools/none-ls.nvim")
	use("MunifTanjim/prettier.nvim")

	-- Nice things
	use("jbyuki/instant.nvim")
	use("petertriho/nvim-scrollbar")
	use("terrortylor/nvim-comment")
	-- use({
	-- "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	-- config = function()
	-- require("lsp_lines").setup()
	-- end,
	-- })
	use("SmiteshP/nvim-navic")
	use("LunarVim/breadcrumbs.nvim")
	use("nvim-treesitter/nvim-treesitter-context")
	use("echasnovski/mini.indentscope")

	-- Deps
	use("nvim-lua/plenary.nvim")

	-- Games, because why not?
	use("alec-gibson/nvim-tetris")

	-- Dependencies
	use("stevearc/dressing.nvim")
	use("MunifTanjim/nui.nvim")

	-- Optional dependencies
	use("nvim-tree/nvim-web-devicons") -- Or use 'echasnovski/mini.icons'
	use("HakonHarnes/img-clip.nvim")
	-- use("zbirenbaum/copilot.lua")

	-- Install 'avante.nvim' from source
	-- use({ "yetone/avante.nvim", branch = "main", run = "make" })
end)
