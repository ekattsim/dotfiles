return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "LspAttach",
	opts = {},
	keys = {
		{ "<leader>qf", ":TroubleToggle quickfix<CR>", desc = "send quickfix to trouble" },
	},
	enabled = false,
}
