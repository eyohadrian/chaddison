return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  event = "VeryLazy",
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    legacy_commands = false,
    frontmatter = {
      enabled = false,
    },
    note = {
      template = vim.NIL,
    },
    note_id_func = function(title)
      return title
    end,
    workspaces = {
      {
        name = "MenteCobre",
        path = "~/MenteCobre",
        overrides = {
          new_notes_location = "notes_subdir",
          notes_subdir = "_WIP/",
        },
      },
    },
    picker = {
      name = "telescope.nvim",
    },
    ui = { enable = false },
  },
}
