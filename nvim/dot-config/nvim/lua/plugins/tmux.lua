return {
	"nathom/tmux.nvim",
	keys = {
		{
			"<C-h>",
			"<cmd>lua require('tmux').move_left()<CR><C-w>=<cmd>lua vim.g.toggleState=false<CR>",
			mode = { "n", "i" },
		},
		{
			"<C-j>",
			"<cmd>lua require('tmux').move_down()<CR><C-w>=<cmd>lua vim.g.toggleState=false<CR>",
			mode = { "n", "i" },
		},
		{
			"<C-k>",
			"<cmd>lua require('tmux').move_up()<CR><C-w>=<cmd>lua vim.g.toggleState=false<CR>",
			mode = { "n", "i" },
		},
		{
			"<C-l>",
			"<cmd>lua require('tmux').move_right()<CR><C-w>=<cmd>lua vim.g.toggleState=false<CR>",
			mode = { "n", "i" },
		},
	},
}
