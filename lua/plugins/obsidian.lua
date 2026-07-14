return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  event = "VeryLazy",
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    legacy_commands = false,
    workspaces = {
      -- {
      --   name = "MenteCobre",
      --   path = "~/MenteCobre",
      -- },
      {
        name = "kepano-obsidian-main",
        path = "~/Downloads/kepano-obsidian-main",
        overrides = {
          new_notes_location = "notes_subdir",
          notes_subdir = "Notes/",
          templates = {
            folder = "Templates/",
          }
        }
      },
    },
    picker = {
      name = "telescope.nvim",
    },
    ui = {enable = false}
  },
}
