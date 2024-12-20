return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader><leader>", function() builtin.find_files({ hidden = true }) end, { desc = "Find Files" })
      vim.keymap.set("n", "<leader>ff", function() builtin.find_files({ hidden = true }) end, { desc = "Find Files" })
      vim.keymap.set("n", "<leader>fg", function() builtin.live_grep({ hidden = true }) end, { desc = "Live Grep" })
      vim.keymap.set("n", "<leader>fo", function() builtin.oldfiles({ hidden = true }) end, { desc = "Old Files" })

      require("telescope").load_extension("ui-select")
    end,
  },
}
