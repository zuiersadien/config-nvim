-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', { expr = true })
vim.api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', { expr = true })

-- Open all folds
vim.api.nvim_set_keymap('n', 'zR', [[:lua require('ufo').openAllFolds()<CR>]],
  { noremap = true, silent = true, desc = 'Open All Folds' })

-- Close all folds
vim.api.nvim_set_keymap('n', 'zM', [[:lua require('ufo').closeAllFolds()<CR>]],
  { noremap = true, silent = true, desc = 'Close All Folds' })

-- Peek folds
vim.api.nvim_set_keymap('n', 'zK', [[:lua require('ufo').peekFoldedLinesUnderCursor()<CR>]],
  { noremap = true, silent = true, desc = 'Peek Folds' })


vim.api.nvim_set_keymap('n', 'db', [[:DBUIToggle<CR>]],
  { noremap = true, silent = true, desc = 'Abrir interfaz de vim-dadbod' })

-- vim.api.nvim_set_keymap('n', 'df', [[:'<,'>DB<CR>]],
--   { noremap = true, silent = true, desc = 'y ejecutar consulta' })
