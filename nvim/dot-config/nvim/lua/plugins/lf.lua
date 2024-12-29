-- Sample configuration is supplied hey there
local opts = {
	border = "rounded",
	escape_quit = true,
}
return {
	"lmburns/lf.nvim",
	keys = {
		{ "<leader>e", "<Cmd>Lf<CR>", { desc = "OnlyLF", noremap = true } },
		{
			"<leader>E",
			"<Cmd>Lf `=getcwd()`<CR>",
		},
	},
	enabled = true,
	-- lazy = false,
	cmd = "Lf",
	config = function()
		vim.g.lf_netrw = 1

		require("lf").setup(opts)

		vim.api.nvim_create_autocmd({ "User" }, {
			pattern = "LfTermEnter",
			callback = function(a)
				vim.api.nvim_buf_set_keymap(a.buf, "t", "q", "q", { nowait = true })
			end,
		})
	end,
	dependencies = {
		"akinsho/toggleterm.nvim",
		config = function()
			local highlights = require("rose-pine.plugins.toggleterm")
			require("toggleterm").setup({ highlights = highlights })
		end,
	},
}
