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

-- Opción A: si tu proyecto usa venv en .venv
-- dap_python.setup(vim.fn.getcwd() .. "/.venv/bin/python")
dap_python.setup("/Users/adrianasensio/.pyenv/shims/python")
-- Si no, pon la ruta real a tu python del venv:
-- dap_python.setup("/ruta/a/tu/venv/bin/python")

-- Debug: pytest (test bajo el cursor)
dap_python.test_runner = "pytest"
