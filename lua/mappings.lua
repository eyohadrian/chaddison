require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("n", "<leader>to", "<cmd>tabnew<CR>",      { desc = "Nueva pestaña" })
map("n", "<leader>tc", "<cmd>tabclose<CR>",    { desc = "Cerrar pestaña" })
map("n", "<leader>tn", "<cmd>tabnext<CR>",     { desc = "Pestaña siguiente" })
map("n", "<leader>tp", "<cmd>tabprevious<CR>", { desc = "Pestaña anterior" })
