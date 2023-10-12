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
    ["gD"] = { "<cmd>Lspsaga peek_definition<CR>", "peek_definition lspsaga" },
    ["<leader>ra"] = { "<cmd>Lspsaga rename<CR>", "lspsaga rename" },
    ["<leader>d"] = { "<cmd>Lspsaga show_line_diagnostics<CR>" },
    ["<leader>D"] = { "<cmd>Lspsaga show_cursor_diagnostics<CR>" },
    ["gr"] = { "<cmd>Lspsaga finder<CR>", "lspsaga refrences" },
    ["<leader>o"] = { "<cmd>Lspsaga outline<CR>", "lspsaga outline" },
    ["K"] = { "<cmd>Lspsaga hover_doc<CR>" },
    ["<leader>ca"] = { "<cmd>Lspsaga code_action<CR>" },
    -- ["<leader>pr"] = { "<cmd>Lspsaga rename ++project<CR>" },
    ["<leader>hh"] = {
      function()
        vim.lsp.inlay_hint(0, nil)
      end,
      "Toggle Inlay Hints",
    },
  },
}

M.telescope = {
  n = {
    --   ["<C-j>"] = {
    --     function()
    --       require("telescope.actions").move_selection_next()
    --     end,
    --   },
    --   ["<C-l"] = {
    --     function()
    --       require("telescope.actions").preview_scrolling_right()
    --     end,
    --   },
    --   ["<C-k>"] = {
    --     function()
    --       require("telescope.actions").move_selection_previous()
    --     end,
    --   },
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

M.fugitive = {
  n = {
    ["<leader>gs"] = { "<cmd>Git<CR>", "Git" },
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint<CR>",
      "Add breakpoint at line",
    },
    ["<leader>dr"] = {
      "<cmd> DapContinue<CR>",
      "Start or continue the debugger",
    },
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
