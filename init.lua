
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
