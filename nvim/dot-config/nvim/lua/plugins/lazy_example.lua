return {
	{ "folke/neoconf.nvim", cmd = "Neoconf" },
	{
		"folke/neodev.nvim",
		opts = {},
		ft = "lua",
		config = function()
			require("neodev").setup({})
		end,
	},
}
