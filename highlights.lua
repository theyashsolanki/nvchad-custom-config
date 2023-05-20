-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
  Comment = {
    italic = true,
  },
  CursorLine = {
    bg = "black2",
  },
  ["@string"] = {
    fg = "#08A04B",
  },
  ["@string.regex"] = {
    fg = "#08A04B",
  },
  Function = {
    fg = "#F9B7FF",
  },
  ["@function"] = {
    fg = "#F9B7FF",
  },
  ["@function.call"] = {
    fg = "#F9B7FF",
  },
  -- ["@keyword.function"] = {
  --   fg = "pink"
  -- },
  ["@keyword.return"] = {
    fg = "baby_pink",
  },
  -- -- ["@constant"] = {
  -- --   fg = "#16F529",
  -- -- },
  -- ["@keyword"] = {
  --   fg = "pink",
  -- },
  -- ["@attribute"] = {
  --   fg = "#C36241",
  -- },
  -- -- ["@constructor"] = {
  -- --   fg = "",
  -- -- },
  ["@property"] = {
    fg = "nord_blue",
    -- fg = "#A52A2A"
  },
  ["@method"] = {
    fg = "#F9B7FF",
  },
  ["@method.call"] = {
    fg = "#F9B7FF",
  },
  DiffAdded = {
    fg = "#00FF00",
  },
  DiffChange = {
    fg = "#C36241",
  },
  ["@parameter"] = {
    fg = "white",
  },
  DiffAdd = {
    fg = "#08A04B"
  },
  String = {
    fg = "#08A04B"
  }
  -- Type = {
  --   fg = "#2aa198"
  -- },
  -- Tag = {
  --   fg = "#2aa198"
  -- }
 
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },
}

return M
