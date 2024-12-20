return {
  {
   "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    config = function()
      require("mason-lspconfig").setup({
        automatic_installation = true
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

      local lsp = vim.g.ruby_lsp_provider or "ruby_lsp"
      local formatter = vim.g.ruby_formatter or "rubocop"

      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
      lspconfig.ts_ls.setup({
        capabilities = capabilities
      })

    --  vim.api.nvim_create_autocmd("BufWritePre", {
    --     pattern = "*.rb",
    --     callback = function()
    --       vim.lsp.buf.format({ timeout_ms = 5000 })
    --     end,
    --   })
      lspconfig.ruby_lsp.setup({
        capabilities = capabilities,
        -- formatter = "rubocop",
        -- cmd = { vim.fn.expand("~/.asdf/shims/ruby-lsp") }
      })

      -- lspconfig.stimulus_ls.setup({
      --   capabilities = capabilities
      -- })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
      vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "Format File" })

      -- ruby lsp docs
      -- vim.api.nvim_create_autocmd("FileType", {
      --   pattern = "ruby",
      --   callback = function()
      --     vim.lsp.start {
      --       name = "rubocop",
      --       cmd = { "bundle", "exec", "rubocop", "--lsp" },
      --     }
      --   end,
      -- })
      -- vim.api.nvim_create_autocmd("BufWritePre", {
      --   pattern = "*.rb",
      --   callback = function()
      --     vim.lsp.buf.format()
      --   end,
      -- })

    end,
  },
}
