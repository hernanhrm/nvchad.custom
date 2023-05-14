local M = {}

M.disabled = {
  n = {
      ["<A-h>"] = "",
      ["<C-a>"] = ""
  }
}

M.nvimtree = {
  n = {
    -- toggle
    ["<leader>pv"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
  }
}

M.custom = {
  n = {
    ["<C-f>"] = {"<cmd>silent !tmux neww tmux-sessionizer<CR>", "Search tmux-sessionizer projects"},
    ["<leader>s"] = {"<cmd>silent !tmux neww tmux-sessionizer<CR>", "Search and replace word in cursor"},
    ["<leader>x"] = {"<cmd>!chmod +x %<CR>", "Set execute permissions to current file", opts = {silent = true}},

    ["<leader>d"] = {'"_d', "Delete to system clipboard"},
    ["<leader>y"] = {'"+y', "Yank to system clipboard"},

    ["n"] = {"nzzzv", "Keep search in the midle"},
    ["N"] = {"Nzzzv", "Keep search in the midle"},

    ["<C-d>"] = {"<C-d>zz", "Navigate file through the middle"},
    ["<C-u>"] = {"<C-u>zz", "Navigate file through the middle"},

    ["J"] = {"mzJ`z", "Put line bellow in current without moving the cursor"},

  },
  v = {
    ["<leader>d"] = {'"_d', "Delete to system clipboard"},
    ["<leader>y"] = {'"+y', "Yank to system clipboard"},


    ["J"] = {":m '>+1<CR>gv=gv", "Move selected text up"},
    ["K"] = {":m '<-2<CR>gv=gv", "Move selected text down"},
  },
  x = {
    ["<leader>p"] = {'"_dP', "Keep pasted text after pasted"},
  }
}

M.lspconfig = {
    n = {
        ["gi"] = {
            "<cmd> Telescope lsp_implementations<CR>",
            "Go to implementations"
        },
        ["<leader>lr"] = {
		"<cmd> Telescope lsp_references<CR>",
            "Go to references"
        },
        ["<leader>lds"] = {
	"<cmd> telescope lsp_document_symbols<CR>",
		"See buffer symbols",
        },
    }
}

M.telescope = {
    n = {
        ["<C-p>"] = {
		"<cmd> Telescope git_files<cr>",
            "Find git files"
        }
    }
}

return M
