return {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      return vim.tbl_deep_extend("force", opts, require "configs.telescope")
    end
}
