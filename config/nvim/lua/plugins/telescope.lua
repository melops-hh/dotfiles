local M = {
  "nvim-telescope/telescope.nvim",
  cmd = {"Telescope"},
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  keys = {
    {"<leader>?", "<cmd> Telescope oldfiles <CR>", desc = "Find recently opened files"},
    {"<leader><space>", "<cmd> Telescope buffers <CR>", desc = "Find existing buffers"},
    {"<leader>ff", "<cmd> Telescope find_files <CR>", desc = "Find Files"},
    {"<leader>fh", "<cmd> Telescope help_tags <CR>", desc = "Find Help"},
    {"<leader>fw", "<cmd> Telescope live_grep <CR>", desc = "Search by Grep"},
    {"<leader>fd", "<cmd> Telescope lsp_document_diagnostics <CR>", desc = "Search Diagnostics"},
    {"<c-p>", "<cmd> Telescope git_files <CR>", desc = "Search Git Files"},
    {"gd", "<cmd> Telescope lsp_definitions <CR>", desc = "Goto Definitions"},
    {"gr", "<cmd> Telescope lsp_references <CR>", desc = "Goto References"},
    {"gI", "<cmd> Telescope lsp_implementations <CR>", desc = "Goto Implementations"},
    {"<leader>D", "<cmd> Telescope lsp_type_definitions <CR>", desc="Type Definitions"},
    {"<leader>ds", "<cmd> Telescope lsp_document_symbols <CR>", desc = "Document Symbols"},
    {"<leader>ws", "<cmd> Telescope lsp_dynamic_workspace_symbols <CR>", desc = "Workspace Symbols"},
    {"<leader>/",
      function ()
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
	  winblend = 10,
	  previewer = false
	})
      end,{desc = "Fuzzily search in current buffer"}
    },
  }
}

function M.config()
  local telescope = require("telescope")
  telescope.setup {
    defaults = {
      layout_strategy = "horizontal",
      layout_config = {
	width = 0.95,
	height = 0.85,
	prompt_position = "top",
	horizontal = {
	  preview_width = function(_, cols, _)
	    if cols > 200 then
	      return math.floor(cols * 0.4)
	    else
	      return math.floor(cols * 0.6)
	    end
	  end,
	},
	vertical = {
	  width = 0.9,
	  height = 0.95,
	  preview_height = 0.5,
	},
	flex = {
	  horizontal = {
	    preview_width = 0.9,
	  },
	},
      },
      sorting_strategy = "ascending",
      prompt_prefix = " ",
      selection_caret = " ",
      mappings = {
	i = {
	  ["<C-u>"] = false,
	  ["<C-d>"] = false,
	  ["<C-h>"] = "which_key"
	}
      }

    }
  }
  telescope.load_extension("fzf")
end

return M
