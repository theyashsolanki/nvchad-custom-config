--@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "solarized_dark",
  theme_toggle = { "solarized_dark", "solarized_dark" },
  transparency = true,
  lsp_semantic_tokens = true,
  hl_override = highlights.override,
  hl_add = highlights.add,
  -- change cursor color
  vim.cmd [[highlight IndentBlanklineContextChar guifg=#9D7CD8 gui=nocombine]],
  vim.cmd "hi def IlluminatedWordText guibg=#2E3440 gui=NONE",
  vim.cmd "hi def IlluminatedWordWrite gui=NONE guibg=#2E3440",
  vim.cmd "hi def IlluminatedWordRead gui=NONE guibg=#2E3440",
  -- highlight yanked text
  vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup='IncSearch', timeout=300}
  augroup END
]],
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
