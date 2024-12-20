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
        ensure_installed = {
          "lua_ls",
          "ts_ls",
          "ruby_lsp",
          "stimulus_ls",
        },
        automatic_installation = true
      })
    end
  },
  -- {
  --   "hrsh7th/cmp-nvim-lsp"
  -- },
  -- {
  --   "hrsh7th/nvim-cmp",
  --   config = function()
  --     require("cmp").setup({
  --       sources = {
  --         { name = 'nvim_lsp' }
  --       }
  --     })
  --   end
  -- },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      -- local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local capabilities = vim.lsp.protocol.make_client_capabilities()

      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
      lspconfig.ts_ls.setup({
        capabilities = capabilities
      })

      vim.cmd("echo 'Resolved ruby-lsp path: " .. vim.fn.expand("~/.asdf/shims/ruby-lsp") .. "'")
      lspconfig.ruby_lsp.setup({
        capabilities = capabilities,
        cmd = { vim.fn.expand("~/.asdf/shims/ruby-lsp") }
      })

      lspconfig.stimulus_ls.setup({
        capabilities = capabilities
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
      vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "Format file" })
    end,
  },
}
