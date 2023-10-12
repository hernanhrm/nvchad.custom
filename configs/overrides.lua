local M = {}

M.treesitter = {
	ensure_installed = {
		"vim",
		"lua",
		"html",
		"css",
		"javascript",
		"typescript",
		"tsx",
		"c",
		"markdown",
		"markdown_inline",
		"go",
		"gowork",
		"gomod",
		"gosum",
		"json",
		"python",
		"python",
		"svelte",
		"astro",
	},
	autotag = {
		enable = true,
		filetypes = {
			"html",
			"javascript",
			"typescript",
			"javascriptreact",
			"typescriptreact",
			"svelte",
			"vue",
			"tsx",
			"jsx",
			"rescript",
			"css",
			"lua",
			"xml",
			"php",
			"markdown",
		},
	},
	indent = { enable = true },
	auto_install = true,
}

M.mason = {
	ensure_installed = {
		-- lua stuff
		"lua-language-server",
		"stylua",

		-- web dev stuff
		"css-lsp",
		"html-lsp",
		"typescript-language-server",
		"prettier",
		"prettierd",
		"eslint-lsp",
		"js-debug-adapter",
		"svelte-language-server",
		"astro-language-server",
		"emmet-language-server",

		-- golang stuff
		"gopls",
		"goimports",
		"golines",

		-- python
		"pyright",
		"ruff",
		"black",
		"isort",

		-- global
		"refactoring",
	},
}

-- git support in nvimtree
M.nvimtree = {
	git = {
		enable = true,
	},

	renderer = {
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
		},
	},
}

return M
