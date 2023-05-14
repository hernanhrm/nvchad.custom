local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})


local opts = {
  sources = {
    -- go
    null_ls.builtins.formatting.gofmt,
    null_ls.builtins.formatting.goimports_reviser,
    null_ls.builtins.formatting.golines,

    -- python
    null_ls.builtins.diagnostics.ruff,
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.isort,
  },
  on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					vim.lsp.buf.format()
				end,
			})
		end
	end,
}

return opts
