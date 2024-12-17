return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				-- null_ls.builtins.formatting.biome,
				null_ls.builtins.formatting.codespell,
				null_ls.builtins.formatting.erb_format,
				null_ls.builtins.formatting.erb_lint,
				null_ls.builtins.formatting.htmlbeautifier,
				null_ls.builtins.formatting.markdownlint,
        null_ls.builtins.formatting.nginx_beautifier,
        null_ls.builtins.formatting.pg_format,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.prisma_format,
        null_ls.builtins.formatting.rubocop,
        null_ls.builtins.formatting.stylelint,
				null_ls.builtins.formatting.stylua,

        null_ls.builtins.diagnostics.actionlint,
        null_ls.builtins.diagnostics.codespell,
        null_ls.builtins.diagnostics.credo,
        null_ls.builtins.diagnostics.dotenv_linter,
        null_ls.builtins.diagnostics.erb_lint,
        null_ls.builtins.diagnostics.markdownlint,
        null_ls.builtins.diagnostics.proselint,
        null_ls.builtins.diagnostics.rubocop,
        null_ls.builtins.diagnostics.stylelint,
        null_ls.builtins.diagnostics.yamllint,
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
