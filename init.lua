
-- map leader to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
-- vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

require("config.lazy")
require("set")
require("remap")

--vim.cmd('set paste')

--vim.cmd('abbreviate ,l <CR><C-h>')

 
--vim.cmd('iabbrev @@greeting Hello There!<CR>This is a pre-written message<CR>Thank you')

vim.keymap.set("n", "<Leader>o", "iOLED_CLEAR<CR>", { noremap = true, silent = true })


vim.cmd([[iabbrev __greeting Hello there<CR>This is a test]])
vim.cmd([[iabbrev dOLED OLED_CLEAR<CR>OLED_CURSOR 0 0<CR>OLED_PRINT]])
