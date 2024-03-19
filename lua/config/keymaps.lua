-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.api.nvim_set_keymap("i", "<Tab>", 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', { expr = true })
vim.api.nvim_set_keymap("i", "<S-Tab>", 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', { expr = true })

vim.api.nvim_set_keymap("n", "dt", "[[:NoNeckPain<CR>]]", { noremap = true, silent = true, desc = "Open All Folds" })
-- Open all folds
-- vim.api.nvim_set_keymap('n', 'zR', [[:lua require('ufo').openAllFolds()<CR>]],
--   { noremap = true, silent = true, desc = 'Open All Folds' })
--
-- -- Close all folds
-- vim.api.nvim_set_keymap('n', 'zM', [[:lua require('ufo').closeAllFolds()<CR>]],
--   { noremap = true, silent = true, desc = 'Close All Folds' })
--
-- -- Peek folds
-- vim.api.nvim_set_keymap('n', 'zK', [[:lua require('ufo').peekFoldedLinesUnderCursor()<CR>]],
--   { noremap = true, silent = true, desc = 'Peek Folds' })
--
vim.api.nvim_set_keymap(
  "n", -- Modo de mapeo: normal
  "8", -- Teclas a mapear
  [[:<C-u>put =repeat(nr2char(10),v:count1)<Bar>execute "'[-1"<CR>]], -- Comando a ejecutar
  { noremap = true, silent = true } -- Opciones adicionales: evitar el mapeo recursivo y silenciar
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>db",
  [[:DBUIToggle<CR>]],
  { noremap = true, silent = true, desc = "Abrir interfaz de vim-dadbod" }
)

vim.keymap.set(
  "n",
  "<leader>wz",
  "<Cmd>call zoom#toggle()<CR>",
  { noremap = true, silent = true, desc = "zoom windows" }
)

vim.keymap.set("n", "<leader>wo", "<C-W>o", { noremap = true, silent = true, desc = "delete other windows" })
--
-- vim.keymap.set("n", "<C-w><C-f>", "<Cmd>VentanaShift<CR>")
--
-- vim.keymap.set("n", "<C-w>f", "<Cmd>VentanaShiftMaintainLinear<CR>")
--
-- vim.api.nvim_set_keymap('n', 'df', [[:'<,'>DB<CR>]],-- vim.api.nvim_set_keymap('n', 'df', [[:'<,'>DB<CR>]],-- vim.api.nvim_set_keymap('n', 'df', [[:'<,'>DB<CR>]],
--   { noremap = true, silent = true, desc = 'y ejecutar consulta' })
