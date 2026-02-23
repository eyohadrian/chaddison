local dap = require("dap")
local dapui = require("dapui")

dapui.setup()
require("nvim-dap-virtual-text").setup()

-- Abre/cierra UI automáticamente
dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

-- DAP Python
local dap_python = require("dap-python")

-- dap_python.setup(vim.fn.getcwd() .. "/.venv/bin/python")
dap_python.setup("/Users/adrianasensio/.pyenv/shims/python")

-- Debug: pytest (test under cursor)
dap_python.test_runner = "pytest"
