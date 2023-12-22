require("nvim-tree").setup({
    view = {
        width = 40,
    },
    filters = {
        dotfiles = true,
    },
})

vim.keymap.set("n", "<leader>tr", vim.cmd.NvimTreeToggle)


