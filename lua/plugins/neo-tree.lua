
return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	config = function()
		require("neo-tree").setup({
			window = {
				width = 30,
			},
			buffers = {
				follow_current_file = {enabled = true},
			},
			filesystem = {
				visible = false,
				hide_dotfiles = false,
				respect_gitignore = true,
				hide_gitignore = true,
				hide_hidden = false,
				always_show = { ".gitignore" },
				never_show = { ".DS_Store", "thumbs.db" },
				bind_to_cwd = false,
				follow_current_file = { enabled = true },
				use_libuv_file_watcher = true,
			},
		})
		vim.keymap.set("n", "<leader>e", ":Neotree filesystem toggle<CR>")
		vim.keymap.set("n", "<leader>be", function()
			require("neo-tree.command").execute({ source = "buffers", toggle = true })
		end, { desc = "Buffer Explorer" })
		vim.keymap.set("n", "<leader>ge", function()
			require("neo-tree.command").execute({ source = "git_status", toggle = true })
		end, { desc = "Git Explorer" })
	end,
}
