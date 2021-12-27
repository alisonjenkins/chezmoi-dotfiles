local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.code_actions.refactoring,
		null_ls.builtins.completion.spell,
		null_ls.builtins.diagnostics.ansiblelint,
		null_ls.builtins.diagnostics.chktex,
		null_ls.builtins.diagnostics.eslint,
		null_ls.builtins.diagnostics.hadolint,
		null_ls.builtins.diagnostics.markdownlint,
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.nixfmt,
		null_ls.builtins.formatting.shellharden,
		null_ls.builtins.formatting.shfmt,
		null_ls.builtins.formatting.sqlformat,
		null_ls.builtins.formatting.stylua,
	},
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
		end
	end,
})
