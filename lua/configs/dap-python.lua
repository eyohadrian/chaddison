local dap = require("dap")
local dapui = require("dapui")

dapui.setup()
require("nvim-dap-virtual-text").setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

-- Commented because now im testing the config and there are errors so i can't see them before the ui closes
-- dap.listeners.before.event_terminated["dapui_config"] = function()
--   dapui.close()
-- end
--
-- dap.listeners.before.event_exited["dapui_config"] = function()
--   dapui.close()
-- end


local dap_python = require("dap-python")


local debugpy_python = vim.fn.expand(
  "~/.virtualenvs/debugpy/bin/python"
)

dap_python.setup(debugpy_python)


dap_python.resolve_python = function()
  
  local env = vim.env.VIRTUAL_ENV or vim.env.CONDA_PREFIX

  if env then
    local python = env .. "/bin/python"

    if vim.fn.executable(python) == 1 then
      return python
    end
  end

  
  for _, name in ipairs({ ".venv", "venv", "env" }) do
    local python = vim.fn.getcwd() .. "/" .. name .. "/bin/python"

    if vim.fn.executable(python) == 1 then
      return python
    end
  end

  
  return vim.fn.exepath("python3")
end


dap_python.test_runner = "pytest"
