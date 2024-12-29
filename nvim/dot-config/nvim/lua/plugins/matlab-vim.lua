return {
	"MortenStabenau/matlab-vim",
	init = function()
		vim.g.matlab_executable = "/Applications/MATLAB_R2024b.app/bin/matlab"
		vim.g.matlab_panel_size = 70
		vim.g.matlab_default_mappings = 0
		vim.g.matlab_auto_start = 0
	end,
	ft = "matlab",
}
