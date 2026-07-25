require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "clangd", "lua_ls" }
vim.lsp.enable(servers)

-- Auto find .venv in buffer project 
vim.lsp.config("pyright", {
  before_init = function(_, config)
    local root_dir = config.root_dir
    if not root_dir then
      return
    end

    local python = vim.fs.joinpath(root_dir, ".venv", "bin", "python")

    if vim.fn.executable(python) == 1 then
      config.settings = config.settings or {}
      config.settings.python = config.settings.python or {}
      config.settings.python.pythonPath = python
    end
  end,
})

vim.lsp.enable("pyright")
