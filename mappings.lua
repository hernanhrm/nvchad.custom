local M = {}
-- local ui = require "harpoon.ui"
-- local mark = require "harpoon.mark"

M.disabled = {
	n = {
		["<A-h>"] = "",
		["<A-i>"] = "",
		["<leader>h"] = "",
		["<C-a>"] = "",
		["<C-n>"] = "",
	},
}

M.nvimtree = {
	n = {
		-- toggle
		["<leader>pv"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
	},
}

M.custom = {
	n = {
		["<C-f>"] = { "<cmd>silent !tmux neww tmux-sessionizer<CR>", "Search tmux-sessionizer projects" },
		["<leader>s"] = { "[[:%s/<<C-r><C-w>>/<C-r><C-w>/gI<Left><Left><Left>]]", "Search and replace word in cursor" },
		["<leader>x"] = { "<cmd>!chmod +x %<CR>", "Set execute permissions to current file", opts = { silent = true } },

		["<leader>d"] = { '"_d', "Delete to system clipboard" },
		["<leader>y"] = { '"+y', "Yank to system clipboard" },

		["n"] = { "nzzzv", "Keep search in the midle" },
		["N"] = { "Nzzzv", "Keep search in the midle" },

		["<C-d>"] = { "<C-d>zz", "Navigate file through the middle" },
		["<C-u>"] = { "<C-u>zz", "Navigate file through the middle" },

		["J"] = { "mzJ`z", "Put line bellow in current without moving the cursor" },
	},
	v = {
		["<leader>d"] = { '"_d', "Delete to system clipboard" },
		["<leader>y"] = { '"+y', "Yank to system clipboard" },

		["J"] = { ":m '>+1<CR>gv=gv", "Move selected text up" },
		["K"] = { ":m '<-2<CR>gv=gv", "Move selected text down" },
	},
	x = {
		["<leader>p"] = { '"_dP', "Keep pasted text after pasted" },
	},
}

M.lspconfig = {
	n = {
		["gi"] = {
			"<cmd> Telescope lsp_implementations<CR>",
			"Go to implementations",
		},
		["<leader>lr"] = {
			"<cmd> Telescope lsp_references<CR>",
			"Go to references",
		},
		["<leader>lds"] = {
			"<cmd> Telescope lsp_document_symbols<CR>",
			"See buffer symbols",
		},
	},
}

M.telescope = {
	n = {
		["<C-p>"] = {
			"<cmd> Telescope git_files<cr>",
			"Find git files",
		},
	},
}

M.harpoon = {
	n = {
		["<leader>hm"] = {
			function()
				require("harpoon.ui").toggle_quick_menu()
			end,
			"Open harpoon's files",
		},
		["<leader>a"] = {
			function()
				require("harpoon.mark").add_file()
			end,
			"Mark current buffer",
		},
		["<A-1>"] = {
			function()
				require("harpoon.ui").nav_file(1)
			end,
			"Open main file",
		},

		["<A-2>"] = {
			function()
				require("harpoon.ui").nav_file(2)
			end,
			"Open secondary file",
		},

		["<A-3>"] = {
			function()
				require("harpoon.ui").nav_file(3)
			end,
			"Open third file",
		},

		["<A-4>"] = {
			function()
				require("harpoon.ui").nav_file(4)
			end,
			"Open fourth file",
		},
	},
}

M.trouble = {
	n = {
		["<leader>tt"] = { "<cmd>TroubleToggle<CR>", "Show all troubles window", { silent = true } },
		["<leader>td"] = {
			"<cmd>TroubleToggle document_diagnostics<CR>",
			"Show all troubles window",
			{ silent = true },
		},
	},
}

M.dap = {
	n = {
		["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>", "Toggle breakpoint at current line" },
		["<leader>dr"] = { "<cmd> DapContinue <CR>", "Run or continue the debugger" },
	},
}

return M
