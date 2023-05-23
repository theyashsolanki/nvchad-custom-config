--@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  -- changed_theme = {
  --   solarized = {
  -- --     base_16 = {
  -- --       base00 = "#002b36",
  -- --       base01 = "#073642",
  -- --       base02 = "#586e75",
  -- --       base03 = "#657b83",
  -- --       base04 = "#839496",
  -- --       base05 = "#93a1a1",
  -- --       base06 = "#eee8d5",
  -- --       base07 = "#fdf6e3",
  -- --       base08 = "#b58900",
  -- --       base09 = "#cb4b16",
  -- --       base0A = "#dc322f",
  -- --       base0B = "#d33682",
  -- --       base0C = "#6c71c4",
  -- --       base0D = "#268bd2",
  -- --       base0E = "#2aa198",
  -- --       base0F = "#859900",
  -- --     },
  --     base_30 = {
  --       yellow = "#FFFF00",
  --       orange = "#FFA500",
  -- --       red = "#dc322f",
  -- --       baby_pink = "#d33682",
  -- --       nord_blue = "#6c71c4",
  -- --       blue = "#268bd2",
  -- --       cyan = "#2aa198",
  -- --       green = "#859900",
  -- --       sun = "#b58900",
  -- --       white = "#fdf6e3",
  -- --       black2 = "#002b36",
  -- --       
  --     },
  --   },
  -- },
  theme = "onedark",
  theme_toggle = { "onedark", "onedark" },
  transparency = false,
  lsp_semantic_tokens = true,
  hl_override = highlights.override,
  hl_add = highlights.add,
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
