---@type MappingsTable
local M = {}

M.general = {
  n = {
    ["<C-c>"] = { "<ESC>" },
    ["x"] = { '"_x' },
    ["<leader>c+"] = {
      function()
        local current_file = tostring(vim.fn.expand "%")
        if string.match(current_file, "%.cpp$") or string.match(current_file, "%.cxx$") then
          vim.cmd "!g++ --debug %"
        end
      end,
    },
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
    ["gf"] = { "<cmd>Lspsaga finder<CR>", "lspsaga refrences" },
    ["<leader>o"] = { "<cmd>Lspsaga outline<CR>", "lspsaga outline" },
    ["K"] = { "<cmd>Lspsaga hover_doc<CR>", "lspsaga hover_doc" },
    ["<leader>ca"] = { "<cmd>Lspsaga code_action<CR>", "lspsaga code_action" },
    -- ["<leader>pr"] = { "<cmd>Lspsaga rename ++project<CR>" },

    -- ["<leader>d"] = {
    --   function()
    --     vim.diagnostic.open_float { border = "rounded" }
    --   end,
    --   "Floating diagnostic",
    -- },
    ["<leader>ic"] = { "<cmd>Telescope lsp_incoming_calls<CR>", "Telescope incoming calls", opts = { noremap = true } },
    ["<leader>oc"] = { "<cmd>Telescope lsp_outgoing_calls<CR>", "Telescope outgoing calls" },
    ["gr"] = { "<cmd>Telescope lsp_references<CR>", "Telescope lsp refrences", opts = { noremap = true } },
    -- ["<leader>ca"] = {
    --   function()
    --     vim.lsp.buf.code_action()
    --   end,
    --   "LSP code action",
    -- },
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
