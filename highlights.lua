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
    fg = "green",
  },
  ["@string.regex"] = {
    fg = "green",
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
  ["@keyword"] = {
    fg = "#f92672",
  },

  ["@property"] = {
    fg = "#569cd6",
  },
  ["@keyword.operator"] = {
    fg = "#f92672",
  },

  ["@method"] = {
    fg = "#F9B7FF",
  },
  ["@method.call"] = {
    fg = "#F9B7FF",
  },
  DiffAdded = {
    fg = "#08A04B",
  },
  DiffChange = {
    fg = "orange",
  },
  ["@parameter"] = {
    fg = "blue",
  },
  DiffAdd = {
    fg = "#08A04B",
  },

  ["@variable.builtin"] = {
    fg = "#f92672",
  },

  ["@variable"] = {
    -- fg = "#569cd6",
    fg = "#9cdcfe"
  },
  Structure = {
    fg = "#1abc9c",
  },
  DiagnosticError = {
    fg = "#FF0000",
  },
  DiagnosticHint = {
    fg = "#808080",
  },
  Include = {
    fg = "nord_blue",
  },
  -- ["@exception"] = {
  --   fg = "#FF00FF",
  -- },
  ["@namespace"] = {
    fg = "#1abc9c",
  },
  ["@punctuation.delimiter"] = {
    fg = "white",
  },
  ["@punctuation.bracket"] = {
    fg = "#FFA500",
  },
  ["@operator"] = {
    fg = "#F8F6F0",
  },
  Constant = {
    fg = "#f92672",
  },
  ["@constructor"] = {
    fg = "#1abc9c",
  },
  Type = {
    fg = "#1abc9c",
  }
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },
}

return M
