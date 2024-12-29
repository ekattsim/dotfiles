local picker_opts = {
	reuse_win = true,
}

return {
	"nvim-telescope/telescope.nvim",
	enabled = true,
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local actions = require("telescope.actions")
		require("telescope").setup({
			defaults = {
				sorting_strategy = "ascending",
				layout_strategy = "center",
				mappings = {
					i = { ["<C-l>"] = actions.send_to_loclist + actions.open_loclist },
					n = { ["<C-s>"] = actions.send_to_loclist + actions.open_loclist },
				},
				file_ignore_patterns = {
					"venv/",
					"node_modules/",
					"site%-packages/",
					"%.aux",
					"%.out",
					"%.synctex.gz",
					"%.toc",
				},
			},
		})
	end,

	keys = {
		{
			"<leader>t",
			function()
				require("telescope.builtin").find_files(require("telescope.themes").get_dropdown(picker_opts))
			end,
			{ desc = "find files" },
		},
		{ "<leader>b", "<Cmd>Telescope buffers theme=dropdown<CR>", { desc = "find open buffers" } },
		{ "<leader>fF", "<Cmd>Telescope resume theme=dropdown<CR>", { desc = "resume telescope" } },
		{ "<leader>/", "<Cmd>Telescope live_grep theme=dropdown<CR>", { desc = "grep" } },
		{ "<leader>fp", "<Cmd>Telescope builtin theme=dropdown<CR>", { desc = "find pickers" } },
		{ "<leader>fh", "<Cmd>Telescope help_tags theme=dropdown<CR>", { desc = "find pickers" } },
		{ "<leader>fc", "<Cmd>Telescope command_history theme=dropdown<CR>", { desc = "command history" } },
		{ "<leader>fm", "<Cmd>Telescope marks theme=dropdown<CR>", { desc = "find manpages" } },
		{ "<leader>fk", "<Cmd>Telescope keymaps theme=dropdown<CR>", { desc = "find keymaps" } },
		{ "<leader>fo", "<Cmd>Telescope oldfiles theme=dropdown<CR>", { desc = "find oldfiles" } },
	},
}
