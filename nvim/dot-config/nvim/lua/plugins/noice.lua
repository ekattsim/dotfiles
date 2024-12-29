return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		{
			lsp = {
				-- override markdown rendering since cmp and other plugins use Treesitter
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
				signature = {
					opts = { size = {
						max_height = 15,
						max_width = 70,
					} },
				},
				message = {
					enabled = true,
				},
			},
			-- you can enable a preset for easier configuration
			presets = {
				bottom_search = true, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = false, -- add a border to hover docs and signature help
			},
		},
	},
	keys = {
		{
			"<c-d>",
			function()
				if not require("noice.lsp").scroll(4) then
					return "<c-f>"
				end
			end,
			silent = true,
			expr = true,
			desc = "Scroll forward",
			mode = { "i", "s" },
		},
		{
			"<c-u>",
			function()
				if not require("noice.lsp").scroll(-4) then
					return "<c-f>"
				end
			end,
			silent = true,
			expr = true,
			desc = "Scroll backward",
			mode = { "i", "s" },
		},
		{
			"<leader>nn",
			"<Cmd>Noice<CR>",
			silent = true,
			desc = "Toggle Noice",
		},
	},
	dependencies = {
		{ "MunifTanjim/nui.nvim" },
		-- { "rcarriga/nvim-notify" },
	},
	enabled = true,
}
