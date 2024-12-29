return {
	"ThePrimeagen/harpoon",
	keys = {
		{
			"<leader>h",
			function()
				require("harpoon.ui").toggle_quick_menu()
			end,
			desc = "Marks Menu",
		},
		{
			"<leader>a",
			function()
				require("harpoon.mark").add_file()
			end,
			desc = "Add Mark",
		},
		{
			"<leader>j",
			function()
				require("harpoon.ui").nav_file(1)
			end,
			desc = "Mark 1",
		},
		{
			"<leader>k",
			function()
				require("harpoon.ui").nav_file(2)
			end,
			desc = "Mark 2",
		},
		{
			"<leader>l",
			function()
				require("harpoon.ui").nav_file(3)
			end,
			desc = "Mark 3",
		},
		{
			"<leader>;",
			function()
				require("harpoon.ui").nav_file(4)
			end,
			desc = "Mark 4",
		},
	},
	dependencies = { "nvim-lua/plenary.nvim" },
	enabled = false,
}
