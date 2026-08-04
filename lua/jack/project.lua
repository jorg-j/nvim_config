-- Enables the creation of custom nvim commands and configurations for a specific project.
-- Uses these templates as a basis

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

-- Load project config when starting Neovim
load_project_config()

-- Also load when changing directories
vim.api.nvim_create_autocmd('DirChanged', {
  callback = load_project_config
})

