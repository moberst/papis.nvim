--
-- PAPIS | TELESCOPE
--
--
-- Papis Telescope picker
--
-- Adapted from: https://github.com/nvim-telescope/telescope-bibtex.nvim

local telescope = require("telescope")
local finders = require("telescope.finders")
local pickers = require("telescope.pickers")
local actions = require("telescope.actions")
local previewers = require("telescope.previewers")
local telescope_config = require("telescope.config").values
local papis_actions = require("telescope._extensions.papis.actions")

local utils = require("papis.utils")
local db = require("papis.sqlite-wrapper")
if not db then
  return nil
end

---Gets the cite format for the filetype
---@return string #The cite format for the filetype (or fallback if undefined)
local function parse_format_string()
  local cite_format = utils.get_cite_format(vim.bo.filetype)
  if type(cite_format) == "table" then
    cite_format = cite_format[1]
  end
  return cite_format
end

local wrap, preview_format, initial_sort_by_time_added

---Defines the papis.nvim telescope picker
---@param opts table #Options for the papis picker
local function papis_picker(opts)
  opts = opts or {}

  -- get precalculated entries for the telescope picker
  local telescope_precalc = require("papis.search").get_precalc()

  -- local results = db.data:get(nil, required_db_keys)
  local format_string = parse_format_string()

  -- amend the generic_sorter so that we can change initial sorting
  local generic_sorter = telescope_config.generic_sorter(opts)
  local papis_sorter = {}
  setmetatable(papis_sorter, { __index = generic_sorter })

  if initial_sort_by_time_added then
    ---@param prompt string
    ---@param line string
    ---@return number score number from 1 to 0. lower the number the better. -1 will filter out the entry though.
    function papis_sorter:scoring_function(prompt, line, entry)
      local score = generic_sorter.scoring_function(self, prompt, line)
      if #prompt == 0 then
        local min_timestamp = 0
        local max_timestamp = os.time()
        local timestamp = entry.timestamp

        score = 1 - (timestamp - min_timestamp) / (max_timestamp - min_timestamp)
      end
      return score
    end
  end

  pickers
      .new(opts, {
        prompt_title = "Papis References",
        finder = finders.new_table({
          results = telescope_precalc,
          entry_maker = function(entry)
            return entry
          end,
        }),
        previewer = previewers.new_buffer_previewer({
          define_preview = function(self, entry, status)
            local preview_lines = utils:make_nui_lines(preview_format, entry.id)

            for line_nr, line in ipairs(preview_lines) do
              line:render(self.state.bufnr, -1, line_nr)
            end

            vim.api.nvim_set_option_value("wrap", wrap, { win = status.preview_win })
          end,
        }),
        sorter = papis_sorter,
        attach_mappings = function(_, map)
          actions.select_default:replace(papis_actions.ref_insert(format_string))
          map("i", "<c-o>f", papis_actions.open_file(), { desc = "Open file" })
          map("n", "of", papis_actions.open_file(), { desc = "Open file" })
          map("i", "<c-o>n", papis_actions.open_note(), { desc = "Open note" })
          map("n", "on", papis_actions.open_note(), { desc = "Open note" })
          map("i", "<c-e>", papis_actions.open_info(), { desc = "Open info.yaml file" })
          map("n", "e", papis_actions.open_info(), { desc = "Open info.yaml file" })
          map("n", "f", papis_actions.ref_insert_formatted(), { desc = "Insert formatted reference" })
          map("i", "<c-f>", papis_actions.ref_insert_formatted(), { desc = "Insert formatted reference" })
          -- Makes sure that the other defaults are still applied
          return true
        end,
      })
      :find()
end

return telescope.register_extension({
  setup = function(opts)
    wrap = opts.wrap
    initial_sort_by_time_added = opts.initial_sort_by_time_added
    preview_format = opts.preview_format
  end,
  exports = {
    papis = papis_picker,
  },
})
