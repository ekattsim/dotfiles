return {
	"rhysd/vim-fixjson",
	init = function()
		vim.g.fixjson_indent_size = 4
	end,
	keys = {
		{ "<leader>ff", "<Cmd>FixJson<CR>", { desc = "format with fixjson" } },
	},
	enabled = true,
}
