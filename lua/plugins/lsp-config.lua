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
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local lspconfig = require("lspconfig")
      lspconfig.tailwindcss.setup({
        capabilities = capabilities,
      })
      lspconfig.ruby_lsp.setup({
        capabilities = capabilities,
        cmd = { vim.fn.expand("~/.asdf/shims/ruby-lsp") },
        init_options = {
          formatter = "rubocop",
          linters = { "rubocop" },
          rubocop = {
            command = "bundle",
            args = { "exec", "rubocop" },
          },
        },
        settings = {
          rubyLsp = {
            formatter = "auto",
          },
        },
      })

      lspconfig.html.setup({
        capabilities = capabilities,
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })

      -- Add autoformat on save
      -- vim.api.nvim_create_autocmd("BufWritePre", {
      --   callback = function()
      --     vim.lsp.buf.format()
      --   end,
      -- })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show hover documentation" })
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
      vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to references" })
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to definition" })
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Go to references" })
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
      vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
      vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "Format File" })
    end,
  },
}
