return {
	"numToStr/Comment.nvim",
	opts = {
		toggler = {
			line = "gcc",
		},
		opleader = {
			line = "gc",
		},
	},
	keys = {
		{ "gc", "<Plug>(comment_toggle_linewise_current)", mode = { "n", "x" }, { desc = "comment operation" } },
		{ "gcc", "<Plug>(comment_toggle_linewise)", mode = { "n", "x" }, { desc = "un/comment line" } },
		{ "gb", "<Plug>(comment_toggle_blockwise_current)", mode = { "n", "x" }, { desc = "comment operation" } },
		{ "gbc", "<Plug>(comment_toggle_blockwise)", mode = { "n", "x" }, { desc = "un/comment line" } },
	},
}
