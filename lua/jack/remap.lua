
-- remap pv to go to explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc="Open Explorer" })

vim.keymap.set("n", "<Leader>c", ':let @/ = ""<CR>', { desc = 'Clear search highlights' })

vim.keymap.set("n", "<Leader>o", "iOLED_CLEAR<CR>", { noremap = true, silent = true })



vim.keymap.set("n", "<ENTER>", "o<ESC>", { desc = 'Add empty line', noremap = true, silent = true })
vim.keymap.set("n", "<S-ENTER>", "O<ESC>", { desc = 'Add empty line before', noremap = true, silent = true })
vim.keymap.set("n", "fj", "<ESC>", { desc = 'Add empty line before', noremap = true, silent = true })


