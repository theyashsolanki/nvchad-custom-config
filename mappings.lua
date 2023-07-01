---@type MappingsTable
local M = {}

M.general = {
  n = {
    ["<C-c>"] = { "<ESC>" },
    ["x"] = { '"_x' },
    -- toggle transparency
    ["<leader>tt"] = {
      function()
        require("base46").toggle_transparency()
      end,
      "toggle transparency",
    },
    ["<C-Up>"] = {
      function()
        require("smart-splits").resize_up()
      end,
      desc = "Resize split up",
    },
    ["<C-Down>"] = {
      function()
        require("smart-splits").resize_down()
      end,
      desc = "Resize split down",
    },
    ["<C-Left>"] = {
      function()
        require("smart-splits").resize_left()
      end,
      desc = "Resize split left",
    },
    ["<C-Right>"] = {
      function()
        require("smart-splits").resize_right()
      end,
      desc = "Resize split right",
    },
  },
  v = {
    ["D"] = { '"_d' },
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
  -- v = {
  --   ["<leader>ca"] = { "<cmd>Lspsaga code_action<CR>" },
  -- },
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

M.fugitive = {
  n = {
    ["<leader>gs"] = { "<cmd>Git<CR>", "Git" },
  },
}

M.nvimtree = {
  n = {
    ["<C-s>"] = {
      function()
        require("nvim-tree.api").node.open.vertical()
      end,
      "open file in vertical split",
    },
  },
}


return M
