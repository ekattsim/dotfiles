---@diagnostic disable: need-check-nil
return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local ascii = require("ascii.text")
		local dashboard = require("alpha.themes.dashboard")
		dashboard.section.header.val = ascii.neovim.def_leppard
		dashboard.section.buttons.val = {
			dashboard.button("t", "󰙅  File-Tree", "<Cmd>Lf<CR>"),
			dashboard.button(
				"f",
				"  Find file",
				'<Cmd>lua require("telescope.builtin").find_files(require("telescope.themes").get_dropdown(picker_opts))<CR>'
			),
			dashboard.button("/", "󰈬  Grep", "<Cmd>Telescope live_grep theme=dropdown<CR>"),
			dashboard.button("m", "  Marks", "<Cmd>Telescope marks theme=dropdown<CR>"),
			dashboard.button("s", "󰦛  Restore NVIM", "<CMD>lua require('persistence').load()<CR>"),
			dashboard.button("q", "󰅚  Quit NVIM", ":qa<CR>"),
		}

		dashboard.config.opts.noautocmd = true

		vim.cmd([[autocmd User AlphaReady echo 'ready']])

		alpha.setup(dashboard.config)
	end,
	enabled = false,
}
