
-- -- map leader to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
--

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
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

vim.keymap.set("n", "<Leader>\\", ':luafile $MYVIMRC<CR>', { desc = 'Reload luafile' })

-- pane navigation
vim.keymap.set("n", "<Leader>h", '<C-w>h', { desc = 'Move Left' })
vim.keymap.set("n", "<Leader>l", '<C-w>l', { desc = 'Move Right' })
vim.keymap.set("n", "<Leader>j", '<C-w>j', { desc = 'Move Down' })
vim.keymap.set("n", "<Leader>k", '<C-w>k', { desc = 'Move Up' })


-- Creates .editorconfig in the current directory
vim.api.nvim_create_user_command('EditorConfig', function()
    local template = vim.fn.readfile(vim.fn.expand('~/.config/nvim/templates/editorconfig.template'))
    vim.fn.writefile(template, '.editorconfig')
    vim.cmd('edit .editorconfig')
end, {})

-- Creates .editorconfig in the current directory
vim.api.nvim_create_user_command('Initfile', function()
    local template = vim.fn.readfile(vim.fn.expand('~/.config/nvim/templates/init.template'))
    vim.fn.mkdir('.nvim', 'p')
    vim.fn.writefile(template, '.nvim/init.lua')
    vim.cmd('edit .nvim/init.lua')
end, {})

-- Utalise an init.lua file if it exists in the project
local project_config = vim.fn.getcwd() .. '/.nvim/init.lua'
if vim.fn.filereadable(project_config) == 1 then
    vim.cmd('source ' .. project_config)
end

-- Setup hotkeys per filetype
vim.keymap.set('n', '<F5>', function()
    -- Example: Run current file if it's Python
    if vim.bo.filetype == 'python' then
        vim.cmd('!python %')
    -- Or run `make` if Makefile exists
    elseif vim.fn.filereadable('Makefile') == 1 then
        vim.cmd('!make')
    else
        print("No command defined for <F5> in this project.")
    end
end, { desc = 'Run project-specific command' })


-- Used to find and load project based configs
local function load_project_config()
  local project_config = vim.fn.findfile('.nvim.lua', '.;')
  if project_config ~= '' then
    local ok, err = pcall(dofile, project_config)
    if not ok then
      vim.notify('Error loading project config: ' .. err, vim.log.levels.ERROR)
    end
  end
end

-- Load project config when starting Neovim
load_project_config()

-- Also load when changing directories
vim.api.nvim_create_autocmd('DirChanged', {
  callback = load_project_config
})



