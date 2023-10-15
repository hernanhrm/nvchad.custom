local overrides = require("custom.configs.overrides")

local plugins = {
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},
	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
		opts = {
			-- make sure mason installs the server
			servers = {
				-- html
				html = {
					filetypes = {
						"html",
						"javascript",
						"javascriptreact",
						"javascript.jsx",
						"javascript.svelte",
						"javascript.astro",
						"typescript",
						"typescriptreact",
						"typescript.tsx",
					},
				},
				-- Emmet
				emmet_ls = {
					init_options = {
						html = {
							options = {
								-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
								["bem.enabled"] = true,
							},
						},
					},
				},
				-- CSS
				cssls = {},
				tailwindcss = {
					filetypes_exclude = { "markdown" },
				},
			},
		},
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		ft = { "lua", "go", "python", "html", "css", "json", "javascript", "sql", "typescript", "yaml" },
		opts = function()
			return require("custom.configs.null-ls")
		end,
	},
	{
		"mfussenegger/nvim-dap",
		config = function()
			require("custom.configs.dap")
			require("core.utils").load_mappings("dap")
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		dependencies = "mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			require("dapui").setup()

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end

			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end

			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
	{
		"leoluz/nvim-dap-go",
		ft = "go",
		dependencies = "mfussenegger/nvim-dap",
		config = function(_, opts)
			require("dap-go").setup(opts)
			-- require("core.utils").load_mappings("dap_go")
		end,
	},
	{
		"olexsmir/gopher.nvim",
		ft = "go",
		config = function(_, opts)
			require("gopher").setup(opts)
		end,
		build = function()
			vim.cmd([[silent! GoInstallDeps]])
		end,
	},
	{
		"ThePrimeagen/harpoon",
		lazy = false,
		dependencies = "nvim-lua/plenary.nvim",
		priority = 0,
	},
	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
	},
	{
		"github/copilot.vim",
		lazy = false,
	},
	{
		"NvChad/nvterm",
		enabled = false,
	},
	{
		"wakatime/vim-wakatime",
		lazy = false,
	},
	{
		"folke/zen-mode.nvim",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			window = {
				options = {
					number = true,
					relativenumber = true,
				},
			},
			plugins = {
				alacritty = {
					enabled = true,
					font = "12",
				},
			},
		},
		lazy = false,
	},
	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		ft = { "lua", "go", "python", "html", "css", "json", "javascript", "sql", "typescript" },
		opts = function()
			return require("custom.configs.null-ls")
		end,
	},
	{
		"mfussenegger/nvim-dap",
	},
	{
		"leoluz/nvim-dap-go",
		ft = "go",
		dependencies = "mfussenegger/nvim-dap",
		config = function(_, opts)
			require("dap-go").setup(opts)
			-- require("core.utils").load_mappings("dap_go")
		end,
	},
	{
		"olexsmir/gopher.nvim",
		ft = "go",
		config = function(_, opts)
			require("gopher").setup(opts)
		end,
		build = function()
			vim.cmd([[silent! GoInstallDeps]])
		end,
	},
	{
		"ThePrimeagen/harpoon",
		lazy = false,
		dependencies = "nvim-lua/plenary.nvim",
		priority = 0,
	},
	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
	},
	{
		"github/copilot.vim",
		lazy = false,
	},
	{
		"NvChad/nvterm",
		enabled = false,
	},
	{
		"wakatime/vim-wakatime",
		lazy = false,
	},
	{
		"folke/zen-mode.nvim",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			window = {
				options = {
					number = true,
					relativenumber = true,
				},
			},
			plugins = {
				alacritty = {
					enabled = true,
					font = "12",
				},
			},
		},
		lazy = false,
	},
	{
		"editorconfig/editorconfig-vim",
	},
	{
		"tpope/vim-dadbod",
		lazy = false,
	},
	{
		"kristijanhusak/vim-dadbod-ui",
		lazy = false,
	},
	{
		"kristijanhusak/vim-dadbod-completion",
		lazy = false,
	},
	{
		"windwp/nvim-ts-autotag",
		dependencies = "nvim-treesitter/nvim-treesitter",
		opts = {
			autotag = {
				enable = true,
				enable_rename = true,
				enable_close = true,
				enable_close_on_slash = true,
			},
		},
		lazy = true,
		event = "VeryLazy",
	},
	{
		"iamcco/markdown-preview.nvim",
	},
	{
		"nvim-lua/plenary.nvim",
	},
	{
		"Jezda1337/nvim-html-css",
		dependencies = {
			"hrsh7th/nvim-cmp",
			"nvim-treesitter/nvim-treesitter",
		},
		lazy = false,
	},
	{
		"roobert/tailwindcss-colorizer-cmp.nvim",
		-- optionally, override the default options:
		config = function()
			require("tailwindcss-colorizer-cmp").setup({
				color_square_width = 2,
			})
		end,
	},
	{
		"sveltejs/language-tools",
		config = function()
			require("configs.lspconfig").svelte.setup()
		end,
	},
}

return plugins
