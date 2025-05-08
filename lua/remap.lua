local wk = require("which-key")
wk.add({

  { "<leader>t", "<CMD>vertical botright term ++kill=term<CR>", desc = "Create a terminal" },
  { "<leader>b", "<CMD>ls<CR>", desc = "Show Buffers" },
  
--  { "<C-d>", "<C-d>zz", desc = "Half page down and center"},
--  { "<C-u>", "<C-u>zz", desc = "Half page up and center"},
--  { "J", "mzJ`z", desc = "Join lines and keep cursor position"},
--  { "n", "nzzzv", desc = "Next search result and center"},
--  { "N", "Nzzzv", desc = "Previous search result and center"},
})










--which_key.register(non_lsp_mappings)
