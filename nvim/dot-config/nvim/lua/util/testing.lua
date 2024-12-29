local cwd = vim.fn.getcwd()

local function dirToFileName(dir)
	local dirAsArray = {}
	for i = 1, #dir do
		dirAsArray[i] = dir:sub(i, i)
		if dirAsArray[i] == "/" then
			dirAsArray[i] = "_"
		end
	end

	local dirAsFileName = table.concat(dirAsArray)
	return dirAsFileName
end

local cwdAsFileName = dirToFileName(cwd)

local shadaPath = "/Users/abhijeetsurakanti/.local/state/nvim/shada/"
local shadaFile = shadaPath .. cwdAsFileName .. ".shada"
if vim.fn.filereadable(shadaFile) == 1 then
	-- print(shadaFile)
	vim.cmd("rshada! " .. shadaFile)
else
	vim.cmd("!touch " .. shadaFile)
	vim.cmd.rshada(shadaFile)
end
