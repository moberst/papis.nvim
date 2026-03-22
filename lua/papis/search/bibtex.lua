--
-- PAPIS | SEARCH | BIBTEX
--
--
-- Handles exporting and inserting BibTeX entries via the papis CLI.
--

local config = require("papis.config")

---@class PapisSearchBibtex
local M = {}

---Export BibTeX for a single entry via papis CLI
---@param papis_id string
---@return string? bibtex The BibTeX string, or nil on error
local function export_bibtex(papis_id)
  local cmd = vim.list_extend(
    vim.deepcopy(config.papis_cmd_base),
    { "export", "--format", "bibtex", "papis_id:" .. papis_id }
  )
  local result = vim.system(cmd, { text = true }):wait()
  if result.code ~= 0 then
    vim.notify(
      string.format("Failed to export BibTeX for papis_id '%s': %s", papis_id, result.stderr or "unknown error"),
      vim.log.levels.ERROR
    )
    return nil
  end
  local bibtex = result.stdout:gsub("\n+$", "")
  return bibtex
end

---Insert BibTeX entries at cursor for the given papis_ids
---@param papis_ids string[] List of papis_id values
function M.insert_bibtex(papis_ids)
  local entries = {}
  for _, papis_id in ipairs(papis_ids) do
    local bibtex = export_bibtex(papis_id)
    if bibtex then
      entries[#entries + 1] = bibtex
    end
  end

  if #entries == 0 then
    return
  end

  local full_text = table.concat(entries, "\n\n")
  local lines = vim.split(full_text, "\n", { plain = true })
  vim.api.nvim_put(lines, "l", true, true)
end

return M
