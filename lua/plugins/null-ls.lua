-- https://github.com/nvimtools/none-ls.nvim/wiki/Formatting-on-save
-- brew install codespell
-- sudo apt-get install codespell

return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		null_ls.setup({
			sources = {
				-- https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md
				-- typo
				null_ls.builtins.diagnostics.codespell,
				null_ls.builtins.formatting.codespell,
				null_ls.builtins.completion.spell,
				null_ls.builtins.diagnostics.markdownlint,
				null_ls.builtins.formatting.markdownlint,
				null_ls.builtins.diagnostics.proselint,
				null_ls.builtins.code_actions.proselint,
				-- misc
				null_ls.builtins.diagnostics.dotenv_linter,
				null_ls.builtins.diagnostics.stylelint,
				null_ls.builtins.formatting.stylelint,
				null_ls.builtins.diagnostics.yamllint,
				-- db
				null_ls.builtins.formatting.pg_format,
				null_ls.builtins.formatting.prisma_format,
				-- nvim/lua
				null_ls.builtins.completion.luasnip,
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.completion.nvim_snippets,
				-- rails
				-- null_ls.builtins.formatting.rubocop,
				-- null_ls.builtins.diagnostics.rubocop,
				-- null_ls.builtins.formatting.rubocop.with({
				-- command = vim.fn.expand("$HOME/.asdf/shims/rubocop") -- or wherever your rubocop is installed
				-- }),
				-- null_ls.builtins.diagnostics.rubocop.with({
				-- command = vim.fn.expand("$HOME/.asdf/shims/rubocop")
				-- }),
				-- null_ls.builtins.diagnostics.erb_lint.with({
				-- command = vim.fn.expand("$HOME/.asdf/shims/erblint")
				-- }),
				-- null_ls.builtins.formatting.erb_lint.with({
				-- command = vim.fn.expand("$HOME/.asdf/shims/erblint")
				-- }),
				-- null_ls.builtins.formatting.erb_format
				-- null_ls.builtins.formatting.htmlbeautifier.with({
				-- command = vim.fn.expand("$HOME/.asdf/shims/htmlbeautifier")
				-- }),
				-- typescript
				null_ls.builtins.formatting.prettier,
				-- null_ls.builtins.formatting.biome
				-- elixir
				null_ls.builtins.diagnostics.credo,
				null_ls.builtins.formatting.mix,
				-- python
				null_ls.builtins.formatting.black,
			},

			-- you can reuse a shared lspconfig on_attach callback here
			--     on_attach = function(client, bufnr)
			--       if client.supports_method("textDocument/formatting") then
			--         vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			--         vim.api.nvim_create_autocmd("BufWritePre", {
			--           group = augroup,
			--           buffer = bufnr,
			--           callback = function()
			--             vim.lsp.buf.formatting_sync({ async = false })
			--           end,
			--         })
			--       end
			--     end,
			--   })
			--
			--   vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "Format File" })
		})
	end,
}
