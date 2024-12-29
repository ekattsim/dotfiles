-- neorg-specific options
vim.opt_local.conceallevel = 3

-- todo maps
vim.keymap.set("n", "<C-space>;", "<Plug>(neorg.qol.todo-items.todo.task-cycle)", { buffer = true })

-- telescope map
vim.keymap.set("i", "<C-l>", "<Esc><Cmd>Telescope neorg insert_link<CR>", { buffer = true })
vim.keymap.set("n", "<leader>ab", "<Cmd>Telescope neorg find_backlinks<CR>", { buffer = true })
