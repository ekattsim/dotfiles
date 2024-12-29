return {
	"nvimdev/lspsaga.nvim",
	event = "LspAttach",
	config = function()
		require("lspsaga").setup({
			ui = {
				code_action = " 󰻸",
				border = "double",
			},
			code_action = {
				show_server_name = true,
				keys = {
					quit = "<Esc>",
				},
			},
			rename = {
				keys = {
					quit = "q",
				},
			},
      symbol_in_winbar = {
        folder_level = 1
      },
      lightbulb = {
        virtual_text = false
      }
		})
	end,
	enabled = true,
}
