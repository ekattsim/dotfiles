return {
	"nvim-treesitter/nvim-treesitter",
	lazy = vim.fn.argc(-1) == 0,
	event = "VeryLazy",
	enabled = true,
	cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
	keys = {
		{ "<A-space>", desc = "Increment selection" },
		{ "<bs>", desc = "Decrement selection", mode = "x" },
	},
	config = function()
		---@diagnostic disable-next-line: missing-fields
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				-- shell scripting
				"bash",
				"fish",
				"regex",
				-- C
				"cmake",
				"c",
				"cpp",
				-- web-dev
				"javascript",
				"html",
				"css",
				"json",
				-- config
				"lua",
				"markdown",
				"markdown_inline",
				"vimdoc",
				-- cool shit
				"latex",
				"python",
				"matlab",
				"vhdl",
				"query",
			},

			sync_install = false,

			auto_install = true,

			ignore_install = {},

			auto_tag = {
				enable = true,
			},

			highlight = {
				enable = true,
				-- disable = { "matlab" },
			},

			indent = {
				enable = true,
			},

			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<A-space>",
					node_incremental = "<A-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
			textobjects = {
				move = {
					enable = true,
					goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer" },
					goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer" },
					goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer" },
					goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer" },
				},
			},
		})
	end,
}
