return {
	"nvim-telescope/telescope-frecency.nvim",
	config = function()
		require("telescope").load_extension("frecency")
	end,
	keys = {
		{
			"<leader>t",
			function()
				require("telescope").extensions.frecency.frecency(
					require("telescope.themes").get_dropdown({ reuse_win = true, workspace = "CWD" })
				)
			end,
		},
	},
	enabled = false,
}
