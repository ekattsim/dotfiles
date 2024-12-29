vim.opt.conceallevel = 2
vim.bo.makeprg = 'pdflatex -file-line-error -halt-on-error -interaction=nonstopmode -output-dir="'
	.. vim.fn.expand("%:h")
	.. '" -synctex=1 "'
	.. vim.fn.expand("%")
	.. '"'

vim.keymap.set("n", "<leader>;", function()
	vim.cmd.cclose()
	vim.cmd("silent update")
	require("util.async_make").async_make(function()
		local qflist = vim.fn.getqflist()
		local errors = false

		for key, value in ipairs(qflist) do
			if value.valid == 1 then
				vim.cmd.copen()
				errors = true
				break
			end
		end

		if not errors then
			local check_pdf = 'pgrep -f "zathura ' .. vim.fn.expand("%:p:r") .. '.pdf" >/dev/null || '
			local open_pdf = 'open "' .. vim.fn.expand("%:r") .. '.pdf"'
			vim.fn.jobstart(check_pdf .. open_pdf)
		end
	end)
end, {
	noremap = true,
	silent = true,
	buffer = true,
})
