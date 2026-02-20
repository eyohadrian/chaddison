require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<C-m>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle nvim-tree" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("n", "<leader>to", "<cmd>tabnew<CR>",      { desc = "Nueva pestaña" })
map("n", "<leader>tc", "<cmd>tabclose<CR>",    { desc = "Cerrar pestaña" })
map("n", "<leader>tn", "<cmd>tabnext<CR>",     { desc = "Pestaña siguiente" })
map("n", "<leader>tp", "<cmd>tabprevious<CR>", { desc = "Pestaña anterior" })
-- Terminal
map("n", "<leader>tt", "<cmd>terminal<CR>", { desc = "Terminal en buffer completo" })

-- LSP
map("n", "<leader>ca", vim.lsp.buf.code_action, {desc = "LSP code action"})

-- Debug
map("n", "<F5>", function() require("dap").continue() end, { desc = "DAP Continue" })

map("n", "<F10>", function() require("dap").step_over() end, { desc = "DAP Step Over" })

map("n", "<F11>", function() require("dap").step_into() end, { desc = "DAP Step Into" })

map("n", "<F12>", function() require("dap").step_out() end, { desc = "DAP Step Out" })

map("n", "<leader>db", function() require("dap").toggle_breakpoint() end, { desc = "DAP Toggle Breakpoint" })

map("n", "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input "Breakpoint condition: ") end, { desc = "DAP Conditional Breakpoint" })

map("n", "<leader>du", function() require("dapui").toggle() end, { desc = "DAP UI Toggle" })

map("n", "<leader>dt", function() require("dap-python").test_method() end, { desc = "Debug Test Method" })

map("n", "<leader>df", function() require("dap-python").test_class() end, { desc = "Debug Test Class" })
