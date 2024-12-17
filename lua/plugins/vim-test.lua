return {
  "vim-test/vim-test",
  dependencies = {
    "preservim/vimux"
  },
  vim.keymap.set("n", "<leader>tn", ":TestNearest<CR>", { desc = "Test Nearest" }),
  vim.keymap.set("n", "<leader>tf", ":TestFile<CR>", { desc = "Test File" }),
  vim.keymap.set("n", "<leader>ta", ":TestSuite<CR>", { desc = "Test All" }),
  vim.keymap.set("n", "<leader>tl", ":TestLast<CR>", { desc = "Test Last" }),
  vim.cmd("let test#strategy = 'neovim_sticky'"),
  vim.cmd("let test#neovim#term_position = 'vert'"),

  -- typescript
  -- vim.cmd("let test#javascript#runner = 'jest'"),
  -- vim.cmd("let test#typescript#runner = 'jest'"),
  -- vim.cmd("let test#typescriptreact#runner = 'jest'"),

  -- ruby specifics
  vim.cmd("let test#ruby#use_binstubs = 0"), -- client specifics
  vim.cmd("let test#ruby#bundle_exec = 1"),  -- enable bundle exec
}

-- return {
--   "nvim-neotest/neotest",
--   dependencies = {
--     "nvim-neotest/nvim-nio",
--     "nvim-lua/plenary.nvim",
--     "antoinemadec/FixCursorHold.nvim",
--     "nvim-treesitter/nvim-treesitter",
--     "olimorris/neotest-rspec",
--   },
--   config = function()
--     local neotest = require("neotest")
--
--     neotest.setup({
--       adapters = {
--         require("neotest-rspec")
--       }
--     })
--
--     vim.keymap.set("n", "<leader>tn", function() neotest.run.run() end, { desc = "Test Nearest" })
--     vim.keymap.set("n", "<leader>tf", function() neotest.run.run(vim.fn.expand("%")) end, { desc = "Test File" })
--   end
-- }
