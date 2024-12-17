-- add more treesitter parsers
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			sync_install = false,
			modules = {},
			ignore_install = {},
			auto_install = true,
			indent = { enable = true },
			highlight = { enable = true },
			ensure_installed = {
				"bash",
				"html",
				"javascript",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"regex",
				"tsx",
				"typescript",
				"vim",
				"yaml",
			},
		})
	end,
}

