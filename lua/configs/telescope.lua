local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

local function telescope_send_to_opencode(prompt_bufnr)
  local picker = action_state.get_current_picker(prompt_bufnr)

  local selections = picker:get_multi_selection()

  if vim.tbl_isempty(selections) then
    selections = { action_state.get_selected_entry() }
  end

  local items = vim.tbl_map(function(item)
    local file = item.path or item.filename or item.value

    if file then
      return require("opencode.context").format(file, {
        start_line = item.lnum,
        start_col = item.col,
        end_line = item.end_lnum,
        end_col = item.end_col,
      })
    end

    return item.text or item.ordinal or item.value
  end, selections)

  items = vim.tbl_filter(function(item)
    return item ~= nil and item ~= ""
  end, items)

  if #items > 0 then
    require("opencode").prompt(table.concat(items, " "))
  end
end

return {
  defaults = {
    mappings = {
      n = {
        ["o"] = telescope_send_to_opencode,
      },
    },
  },
}
