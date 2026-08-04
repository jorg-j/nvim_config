
-- -- map leader to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
--

-- Make line numbers default
vim.opt.number = true
-- Relative line numbers, to help with jumping.
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'
vim.o.termguicolors=true


require("config.lazy")
require("set")
require("remap")
require("jack")

--vim.cmd('set paste')

--vim.cmd('abbreviate ,l <CR><C-h>')
--vim.cmd('iabbrev @@greeting Hello There!<CR>This is a pre-written message<CR>Thank you')

-- Reload the Lua File with <Leader> \
vim.keymap.set("n", "<Leader>\\", ':luafile $MYVIMRC<CR>', { desc = 'Reload luafile' })

-- pane navigation
vim.keymap.set("n", "<Leader>h", '<C-w>h', { desc = 'Move Left' })
vim.keymap.set("n", "<Leader>l", '<C-w>l', { desc = 'Move Right' })
vim.keymap.set("n", "<Leader>j", '<C-w>j', { desc = 'Move Down' })
vim.keymap.set("n", "<Leader>k", '<C-w>k', { desc = 'Move Up' })

-- lsp
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'pylsp', 'ruff'},
  handlers = {
    lsp_zero.default_setup,
  },
})
