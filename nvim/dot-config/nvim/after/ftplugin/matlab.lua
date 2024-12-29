vim.bo.syntax = "matlab"

vim.keymap.set("n", "K", "<Cmd>MatlabDoc<CR>", { desc = "Hover doc for matlab" })
vim.keymap.set("n", "<leader>;", "<Cmd>MatlabRun<CR>", { desc = "Execute Matlab file" })
