local lsp = require("lsp-zero")

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>gws", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "<leader>gd", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "<leader>ga", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>gr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>gn", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {
		'rust_analyzer',
	},
	handlers = {
		lsp.default_setup,
		lua_ls = function()
			local lua_opts = lsp.nvim_lua_ls()
			require('lspconfig').lua_ls.setup(lua_opts)
		end,
	}
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }


-- When pressing tab or enter: if there's no selection, select and confirm 
-- if there is only one option, otherwise select the first option (without 
-- confirming). If there is a selection, confirm it.
local on_auto_select = function(fallback)
    if cmp.visible() then
        local entry = cmp.get_selected_entry()
        if not entry then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            if #cmp.get_entries() == 1 then
                cmp.confirm()
            end
        else
            cmp.confirm()
        end
    else
        fallback()
    end
end

cmp.setup({
	sources = {
		{name = 'path'},
		{name = 'nvim_lsp'},
		{name = 'nvim_lua'},
	},
	formatting = lsp.cmp_format(),
	mapping = cmp.mapping.preset.insert({
		['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
		['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
		['<C-y>'] = cmp.mapping.confirm({ select = true }),
		['<Tab>'] = cmp.mapping(on_auto_select, {"i", "s", "c",}),
        ['<CR>'] = cmp.mapping(on_auto_select, {"i", "s", "c",}),
    })
})
