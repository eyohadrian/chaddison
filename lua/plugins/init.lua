return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    config = function()
      local null_ls = require "null-ls"

      null_ls.setup {
        sources = {
          null_ls.builtins.formatting.black, -- ahora black ya existe porque Mason lo instaló
        },
      }
    end,
  },
  {
    "mg979/vim-visual-multi",
    branch = "master",
    event = "VeryLazy",
    -- https://github.com/mg979/vim-visual-multi/blob/master/doc/vm-mappings.txt
    -- config = function()
    --   -- Desactiva los keymaps por defecto del plugin
    --   vim.g.VM_default_mappings = 0
    --
    --   -- Define tus propios atajos
    --   vim.g.VM_maps = {
    --     -- seleccionar siguiente ocurrencia
    --     ["Find Under"] = "<M-d>",
    --     ["Find Subword Under"] = "<C-d>",
    --
    --     -- añadir cursor arriba/abajo
    --     ["Add Cursor Down"] = "<M-j>",  -- Alt+j
    --     ["Add Cursor Up"]   = "<M-k>",  -- Alt+k
    --
    --     -- por si quieres entrar al modo de selección manual
    --     ["Select All"] = "<Leader>A",
    --   }
    -- end,
  },
  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
       "html", "css"
  		},
  	},
  },
}
