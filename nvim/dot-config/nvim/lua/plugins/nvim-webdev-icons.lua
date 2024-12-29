return {
	"nvim-tree/nvim-web-devicons",
	enabled = true,
	config = function()
		require("nvim-web-devicons").setup({
			override = {
				lua = {
					icon = "",
					color = "#c4a7e7",
					name = "Lua",
				},
			},
		})
	end,
}
