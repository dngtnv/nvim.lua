local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	print("Null-ls is not installed")
	return
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })

local sources = {
	require("typescript.extensions.null-ls.code-actions"),
	null_ls.builtins.diagnostics.eslint_d,
	null_ls.builtins.code_actions.eslint_d,
	null_ls.builtins.formatting.prettier.with({
		extra_args = {
			"--no-semi",
			"--single-quote",
			"--jsx-single-quote",
			"--style",
			"--tab-width 2",
			"--print-width 80",
			"--use-tabs false",
			"--trailingComma es5",
			"--bracketSpacing true",
			"--arrow-parens avoid",
		},
	}),
	-- null_ls.builtins.diagnostics.luacheck,
	null_ls.builtins.formatting.stylua,
	-- null_ls.builtins.formatting.fixjson,
	null_ls.builtins.code_actions.gitsigns,
}

null_ls.setup({
	sources = sources,
	debug = false,
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					--vim.lsp.buf.formatting_sync()
					require("typescript").actions.organizeImports({ sync = true })
					require("typescript").actions.addMissingImports({ sync = true })
					vim.lsp.buf.format({
						timeout_ms = 3000,
						bufnr = bufnr,
						filter = function()
							return client.name == "null-ls"
						end,
					})
				end,
			})
		end
	end,
})
