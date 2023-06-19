--@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "onedark",
  theme_toggle = { "onedark", "onedark" },
  transparency = true,
  lsp_semantic_tokens = true,
  hl_override = highlights.override,
  hl_add = highlights.add,
  -- change cursor color
  vim.cmd "hi Cursor guibg=#61afef guifg=#000000",
  vim.cmd [[highlight IndentBlanklineContextChar guifg=#9D7CD8 gui=nocombine]],
  vim.cmd "hi def IlluminatedWordText guibg=#2E3440 gui=NONE",
  vim.cmd "hi def IlluminatedWordWrite gui=NONE guibg=#2E3440",
  vim.cmd "hi def IlluminatedWordRead gui=NONE guibg=#2E3440",
  -- highlight yanked text
  vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup='IncSearch', timeout=200}
  augroup END
]],
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
