local M = {}

M.updateMark = function()
	local curr_file = vim.fn.expand("%:p")
	local removed = "/Users/abhijeetsurakanti/"
	local relative_path = string.gsub(curr_file, removed, "~/")

	local list = vim.fn.getmarklist()

	for i in ipairs(list) do
		if list[i].file == relative_path and list[i].mark ~= "'0" then
			local mark = string.gsub(list[i].mark, "'", "")
			vim.cmd.mark(mark)
		end
	end
end

return M
