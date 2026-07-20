local log = require "obsidian.log"
local api = require "obsidian.api"
local util = require "obsidian.util"
local link = require "obsidian.link"
local picker = require "obsidian.picker"

local M = {}

function M.execute()
  local note = api.current_note(0)
  if not note then
    return log.info "not in a note"
  end

  local entries = vim.tbl_filter(
    function(entry)
      return entry.filename ~= nil
    end,
    vim.tbl_map(function(match)
      local location = util.parse_link(match.link, { strip = true })
      local path = location and link.resolve_link_path(location)

      return {
        filename = path,
        lnum = 1,
        col = 1,
        text = match.link,
        user_data = match.link,
      }
    end, note:links())
  )

  picker.pick(entries, {
    prompt_title = "Links",
    callback = function(entry)
      api.follow_link(entry.user_data)
    end,
  })
end


return M
