local cwd = vim.fn.getcwd()
local makeprg = "g++-13 -std=c++20 " .. vim.fn.expand("%") .. " -o " .. cwd .. "/exe"

vim.bo.makeprg = makeprg

vim.keymap.set("n", "<leader>;", function()
	vim.cmd.cclose()
	vim.cmd("silent update")
	require("util.async_make").async_make(function()
		local qflist = vim.fn.getqflist()
		local errors = false

		---@diagnostic disable-next-line: unused-local, param-type-mismatch
		for key, value in ipairs(qflist) do
			if value.valid == 1 then
				vim.cmd.copen()
				errors = true
				break
			end
		end

		if not errors then
			-- local run_on_tty = require("util/run_on_tty").run_on_tty
			vim.fn.jobstart("/usr/local/bin/scripts/nvim/run_command.fish")
		end
	end)
end, {
	noremap = true,
	silent = true,
	buffer = true,
})
