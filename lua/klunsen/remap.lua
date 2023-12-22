vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<leader>wh", "<C-w>h")
vim.keymap.set("n", "<leader>wj", "<C-w>j")
vim.keymap.set("n", "<leader>wk", "<C-w>k")
vim.keymap.set("n", "<leader>wl", "<C-w>l")

-- Move selected up or down taking indentation (e.g. if statement) into 
-- consideration.
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Appends line below to current line without moving the cursor
vim.keymap.set("n", "J", "mzJ`z")

-- Keeps cursor centered when moving half pages or between search items (?)
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste but keep in register
vim.keymap.set("x", "<leader>pa", "\"_dP")

-- Previous file
vim.keymap.set("n", "<leader>re", "<C-^>")

-- Source a file
vim.keymap.set("n", "<leader><leader>", function () vim.cmd("so") end)

-- Close a pane
vim.keymap.set("n", "<leader>q", function () vim.cmd("q") end)
