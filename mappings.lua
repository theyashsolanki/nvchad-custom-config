---@type MappingsTable
local M = {}

M.general = {
  n = {
    -- [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<C-c>"] = { "<ESC>" },
  -- toggle transparency
    ["<leader>tt"] = {
      function()
        require("base46").toggle_transparency()
      end,
      "toggle transparency",
    },
  },
  v = {
    ["K"] = { ":m '<-2<CR>gv-gv" },
    ["J"] = { ":m '>+1<CR>gv-gv" },
    ["K"] = { ":m '<-2<CR>gv=gv" },
    ["J"] = { ":m '>+1<CR>gv=gv" },
  },
}

-- more keybinds!
M.lspconfig = {
  n = {
    ["<leader>rf"] = { ":TypescriptRenameFile<CR>", "rename ts file lspsaga" },
    ["gD"] = { "<cmd>Lspsaga peek_definition<CR>", "peek_definition lspsaga" },
    ["<leader>ra"] = { "<cmd>Lspsaga rename<CR>" },
    ["<leader>D"] = { "<cmd>Lspsaga show_line_diagnostics<CR>" },
    ["<leader>d"] = { "<cmd>Lspsaga show_cursor_diagnostics<CR>" },
    ["gf"] = { "<cmd>Lspsaga lsp_finder<CR>" },
    ["<leader>o"] = { "<cmd>Lspsaga outline<CR>" },
    ["K"] = { "<cmd>Lspsaga hover_doc<CR>" },
    -- ["<leader>ca"] = { "<cmd>Lspsaga code_action<CR>" },
    ["<leader>pr"] = { "<cmd>Lspsaga rename ++project<CR>" },
  },
}

M.gitsigns = {
  n = {
    ["<leader>sh"] = { "<cmd>Gitsigns stage_hunk<CR>" },
  },
}

M.UndotreeToggle = {
  n = {
    ["<leader>u"] = { "<cmd>UndotreeToggle<CR>", "UndotreeToggle" },
  },
}


return M
