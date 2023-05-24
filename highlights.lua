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
    fg = "#6698FF",
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
    fg = "white",
  },
  DiffAdd = {
    fg = "#08A04B",
  },

  ["@variable.builtin"] = {
    fg = "#dc322f",
  },

  ["@variable"] = {
    fg = "nord_blue",
  },
  DiagnosticError = {
    fg = "#dc322f",
    bg = "#233745",
  },
  DiagnosticHint = {
    fg = "#1abc9c",
  },
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },
}

return M
