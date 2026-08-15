
-- remap pv to go to explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc="Open Explorer" })

vim.keymap.set("n", "<Leader>c", ':let @/ = ""<CR>', { desc = 'Clear search highlights' })


vim.keymap.set("n", "<ENTER>", "o<ESC>", { desc = 'Add empty line', noremap = true, silent = true })
vim.keymap.set("n", "<S-ENTER>", "O<ESC>", { desc = 'Add empty line before', noremap = true, silent = true })
vim.keymap.set("n", "fj", "<ESC>", { desc = 'Add empty line before', noremap = true, silent = true })

vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { desc = 'Exit term mode', noremap = true, silent = true })



vim.opt.viewoptions:remove("curdir") -- avoid clobbering cwd on load, optional

local augroup = vim.api.nvim_create_augroup("AutoSaveFolds", { clear = true })
vim.api.nvim_create_autocmd("BufWinLeave", {
  pattern = "*",
  group = augroup,
  command = "silent! mkview",
})
vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*",
  group = augroup,
  command = "silent! loadview",
})
