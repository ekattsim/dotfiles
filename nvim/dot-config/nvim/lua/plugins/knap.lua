return {
	"frabjous/knap",
	commit = "d4ea571",
	init = function()
		local gknapsettings = {
			texoutputext = "pdf",
			-- textopdf = "echo %docroot% >> /Users/abhijeetsurakanti/KSU_Classes/summer2024/phys_2211/test.log && pdflatex -halt-on-error -interaction=batchmode %docroot%",
			textopdf = "pdflatex -synctex=1 -halt-on-error -interaction=batchmode %docroot% 2> /Users/abhijeetsurakanti/KSU_Classes/summer2024/phys_2211/test.log",
			-- textopdfviewerlaunch = "echo %outputfile% >> /Users/abhijeetsurakanti/KSU_Classes/summer2024/phys_2211/test.log && sioyek %outputfile% ",
			textopdfviewerlaunch = "sioyek %outputfile%",
			textopdfviewerrefresh = "none",
			textopdfshorterror = 'A=%outputfile% ; LOGFILE="${A%.pdf}.log" ; rubber-info "$LOGFILE" 2>&1 | head -n 1',
			-- textopdfshorterror = "echo %outputfile%",
			delay = 250,
		}
		vim.g.knap_settings = gknapsettings
	end,
	keys = {
		{
			"<leader>cp",
			mode = { "n", "v" },
			function()
				require("knap").process_once()
			end,
		},
		{
			"<leader>cd",
			mode = { "n", "v" },
			function()
				require("knap").close_viewer()
			end,
		},
		{
			"<leader>co",
			mode = { "n", "v" },
			function()
				require("knap").toggle_autopreviewing()
			end,
		},
	},
}
