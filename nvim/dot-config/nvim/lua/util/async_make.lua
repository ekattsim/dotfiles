local M = {}

M.async_make = function(on_compile)
	local makeprg = vim.bo.makeprg
	local lines = { "" }

	if not makeprg then
		return
	end

	local expanded_make = vim.fn.expandcmd(makeprg)

	local function on_event(chan_id, data, name)
		if name == "stdout" or name == "stderr" then
			if data then
				vim.list_extend(lines, data)
			end
		end

		if name == "exit" then
			vim.fn.setqflist({}, " ", {
				title = expanded_make,
				lines = lines,
				efm = vim.o.errorformat,
			})
			vim.cmd("doautocmd QuickFixCmdPost")

			if on_compile then
				on_compile()
			else
				local qflength = vim.fn.len(vim.fn.getqflist())
				if qflength ~= 0 then
					vim.cmd.copen()
				end
			end
		end
	end

	local job_id = vim.fn.jobstart(expanded_make, {
		stdout_buffered = true,
		stderr_buffered = true,
		on_stdout = on_event,
		on_stderr = on_event,
		on_exit = on_event,
	})
end

return M
