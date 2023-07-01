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
  -- TermCursor = {
  --   bg = "blue"
  -- },
  ["@string"] = {
    fg = "green",
  },
  ["@string.regex"] = {
    fg = "green",
  },
  Function = {
    fg = "#FF69B4",
  },
  ["@function"] = {
    fg = "#f692ce",
  },
  ["@function.call"] = {
    fg = "#f692ce",
  },
  -- ["@keyword"] = {
  --   fg = "#f92672",
  -- },

  ["@property"] = {
    fg = "blue",
  },
  -- ["@keyword.operator"] = {
  --   fg = "#f92672",
  -- },

  ["@method"] = {
    fg = "blue",
  },
  ["@method.call"] = {
    fg = "blue",
  },
  DiffAdded = {
    fg = "#08A04B",
  },
  DiffChange = {
    fg = "orange",
  },
  ["@parameter"] = {
    fg = "yellow",
  },
  DiffAdd = {
    fg = "#08A04B",
  },

  -- ["@variable.builtin"] = {
  --   fg = "#f92672",
  -- },
  --
  -- ["@variable"] = {
  --   fg = "#569cd6",
  --   -- fg = "#9cdcfe"
  -- },
  Structure = {
    fg = "#1abc9c",
  },
  DiagnosticError = {
    fg = "#FF0000",
  },
  -- DiagnosticHint = {
  --   fg = "#808080",
  -- },
  -- Include = {
  --   fg = "nord_blue",
  -- },
  -- -- ["@exception"] = {
  -- --   fg = "purple"
  -- -- },
  -- ["@namespace"] = {
  --   fg = "#1abc9c",
  -- },
  -- ["@punctuation.delimiter"] = {
  --   fg = "#eb6f92"
  -- },
  ["@punctuation.bracket"] = {
    fg = "white",
  },
  ["@constant"] = {
    fg = "white",
  },
  -- ["@operator"] = {
  --   fg = "#eb6f92",
  -- },
  ["@constructor"] = {
    fg = "#1abc9c",
  },
  Type = {
    fg = "#1abc9c",
  },
  Repeat = {
    fg = "#9cdcfe",
  }
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },
}

return M
